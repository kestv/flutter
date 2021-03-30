using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlutterApi.Dto;
using FlutterApi.Models;

namespace FlutterApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly FlutterContext _context;

        public UsersController(FlutterContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users
                .Include(x => x.JoinedTournaments)
                .Include(x => x.OrganisedTournaments)
                .Include(x => x.BowlingAlley)
                .ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(long id)
        {
            var user = await _context.Users
                .Include(x => x.JoinedTournaments)
                .Include(x => x.OrganisedTournaments)
                .Include(x => x.BowlingAlley)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }



        [HttpGet("login/{username}")]
        public async Task<ActionResult<Response<User>>> LoginWithUser(string username)
        {
            Response<User> response = new Response<User>();
            var user = await _context.Users.FirstOrDefaultAsync(x => x.Username == username);
            if (user == null)
            {
                response.HasErrors = true;
                response.Message = "User was not found";
                response.Entity = null;
            } 
            else
            {
                response.HasErrors = false;
                response.Message = null;
                response.Entity = user;
            }
            return response;
        }

        // PUT: api/Users/5
        [HttpPut]
        public async Task<ActionResult<User>> Put([FromBody] User user)
        {
            _context.Users.Update(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
        }

        // POST: api/Users
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(long id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(long id)
        {
            _context.Users.FirstOrDefault();
            return _context.Users.Any(e => e.Id == id);
        }
    }
}
