using BogZaplac.Database;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

BogZaplac.Database.Client dbClient = new Client("localhost", 3306, "bogzaplac", "user", "pass"); //TODO: move to config file

builder.Services.AddSingleton<BogZaplac.Database.Client>(x => dbClient);

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseAuthorization();

app.MapControllers();

app.Run();
