﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace FlutterApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ApiController : ControllerBase
    {
        private readonly ILogger<ApiController> _logger;

        public ApiController(ILogger<ApiController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            return "ok";
        }
    }
}
