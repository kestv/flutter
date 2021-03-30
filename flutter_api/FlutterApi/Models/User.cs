using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace FlutterApi.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        [Required, MaxLength(15)]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        [Required, MaxLength(20)]
        public string Name { get; set; }
        [Required, MaxLength(20)]
        public string Surname { get; set; }

        #region References
        public int? BowlingAlleyId { get; set; }
        public BowlingAlley BowlingAlley { get; set; }
        #endregion

        #region Ignored
        [JsonIgnore]
        public List<Tournament> JoinedTournaments { get; set; }
        [JsonIgnore]
        public List<Tournament> OrganisedTournaments { get; set; }
        #endregion
    }
}
