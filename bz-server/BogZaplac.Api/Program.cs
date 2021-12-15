using BogZaplac.Database;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Configuration.AddJsonFile("config.json");

BogZaplac.Database.Client dbClient = new Client(
    builder.Configuration["Database:hostname"], 
    Int32.Parse(builder.Configuration["Database:port"]), 
    builder.Configuration["Database:dbname"], 
    builder.Configuration["Database:username"], 
    builder.Configuration["Database:password"]);

builder.Services.AddSingleton<BogZaplac.Database.Client>(x => dbClient);

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseAuthorization();

app.MapControllers();

app.Run();
