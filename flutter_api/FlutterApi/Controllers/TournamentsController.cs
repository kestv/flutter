using FlutterApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FlutterApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TournamentsController : ControllerBase
    {
        private readonly FlutterContext _context;

        public TournamentsController(FlutterContext context)
        {
            _context = context;
        }
        // GET: api/<TournamentsController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tournament>>> GetTournaments()
        {
            var result = await _context.Tournaments
                .Include(t => t.Users)
                .Include(t => t.BowlingAlley)
                .Include(t => t.Organiser)
                .ToListAsync();
            return result;
        }

        [HttpGet("User/{id}")]
        public async Task<ActionResult<IEnumerable<Tournament>>> GetUserTournaments(long id)
        {
            var result = await _context.Tournaments
                .Include(t => t.Users)
                .Include(t => t.Organiser)
                .Include(t => t.BowlingAlley)
                .Where(t => t.Users.Any(u => u.Id == id))
                .ToListAsync();
            return result;
        }

        // GET api/<TournamentsController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Tournament>> GetTournament(long id)
        {
            var tournament = await _context.Tournaments
                .Include(t => t.Users)
                .Include(t => t.Organiser)
                .Include(t => t.BowlingAlley)
                .SingleAsync(x => x.Id == id);

            if (tournament == null)
            {
                return NotFound();
            }

            return tournament;
        }

        // POST api/<TournamentsController>
        [HttpPost]
        public async Task<ActionResult<Tournament>> AddTournament([FromBody] Tournament tournament)
        {
            tournament.BowlingAlleyId = tournament.BowlingAlley.Id;
            tournament.BowlingAlley = null;
            tournament.OrganiserId = tournament.Organiser.Id;
            tournament.Organiser = null;
            _context.Tournaments.Add(tournament);
            _context.Entry(tournament).State = EntityState.Added;
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetTournament), new { id = tournament.Id }, tournament);
        }

        // PUT api/<TournamentsController>/5
        [HttpPut]
        public async Task<ActionResult<Tournament>> Put([FromBody] Tournament tournament)
        {
            var _tournament = _context.Tournaments
                .Include(t => t.Users)
                .Include(t => t.BowlingAlley)
                .Include(t => t.Organiser)
                .FirstOrDefault(t => t.Id == tournament.Id);

            _context.Entry(_tournament.Organiser).State = EntityState.Detached;

            if (_tournament == null)
            {
                _context.Tournaments.Add(tournament);
                await _context.SaveChangesAsync();
            }
            else
            {
                _context.Entry(_tournament).CurrentValues.SetValues(tournament);
                var _users = _tournament.Users.ToList();
                // Adds new Users
                foreach (var tournamentUser in tournament.Users)
                {
                    if (_users.All(i => i.Id != tournamentUser.Id))
                    {
                        _tournament.Users.Add(tournamentUser);
                    }
                }
                // Removes old Users
                foreach (var tournamentUser in _users)
                {
                    if (tournament.Users.FirstOrDefault(tu => tu.Id == tournamentUser.Id) == null)
                    {
                        _tournament.Users.Remove(tournamentUser);
                    }
                }
                await _context.SaveChangesAsync();
            }

            return CreatedAtAction(nameof(GetTournament), new { id = tournament.Id }, tournament);
        }

        // PUT api/<TournamentsController>/5
        [HttpGet("join/{tournamentId}/{userId}")]
        public async Task<ActionResult<Tournament>> JoinTournament(int tournamentId, int userId)
        {
            var _user = _context.Users
                .FirstOrDefault(u => u.Id == userId);

            var _tournament = _context.Tournaments
                .Include(t => t.Users)
                .FirstOrDefault(t => t.Id == tournamentId);

            if (_tournament == null)
            {
                return NotFound();
            }
            else
            {
                var _users = _tournament.Users.ToList();
                // Adds new Users
                if (_users.All(i => i.Id != _user.Id))
                {
                    _tournament.Users.Add(_user);
                }

                await _context.SaveChangesAsync();
            }

            return _tournament;
        }

        [HttpGet("leave/{tournamentId}/{userId}")]
        public async Task<ActionResult<Tournament>> LeaveTournament(int tournamentId, int userId)
        {
            var tournament = await _context.Tournaments.Include(x => x.Users).SingleAsync(x => x.Id == tournamentId);

            if (tournament == null)
            {
                return NotFound();
            }

            var user = tournament.Users.FirstOrDefault(x => x.Id == userId);
            if (user != null)
            {
                tournament.Users.Remove(user);
                await _context.SaveChangesAsync();
            }
            else
            {
                return NotFound();
            }

            return tournament;
        }

        // DELETE api/<TournamentsController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<int>> Delete(int id)
        {
            var t = await _context.Tournaments.FirstOrDefaultAsync(x => x.Id == id);
            if (t != null)
                _context.Remove(t);
            else
                return NotFound();
            await _context.SaveChangesAsync();

            return id;
        }

        [HttpGet("organised/{organiserId}")]
        public async Task<ActionResult<List<Tournament>>> GetOrganisedTournaments(int organiserId)
        {
            var result = await _context.Tournaments
                .Include(t => t.Users)
                .Include(t => t.Organiser)
                .Include(t => t.BowlingAlley)
                .Where(t => t.Organiser.Id == organiserId)
                .ToListAsync();
            return result;
        }
    }
}
