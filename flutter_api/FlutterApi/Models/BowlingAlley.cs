using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace FlutterApi.Models
{
    public class BowlingAlley
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        [StringLength(512)]
        public string ImageUrl { get; set; }
        public string PhoneNo { get; set; }
        [JsonIgnore]
        public List<Tournament> Tournaments { get; set; }
    }
}
