using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FlutterApi.Models
{
    public class Tournament
    {
        [Key]
        public int Id { get; set; }
        [Required, MaxLength(20)]
        public string Name { get; set; }
        [Required]
        public int MaxPlayers { get; set; }
        public int PlayersCount { get; set; }
        [Required]
        public DateTime Start { get; set; }
        public bool IsStarted { get; set; }
        public bool IsEnded { get; set; }
        public string Prize { get; set; }
        [Required]
        public int BowlingAlleyId { get; set; }
        public BowlingAlley BowlingAlley { get; set; }
        public List<User> Users { get; set; }
        [Required]
        public int OrganiserId { get; set; }
        public User Organiser { get; set; }
    }
}
