using Microsoft.CodeAnalysis.Scripting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using PackFoodReady2Go.Core;
using PackFoodReady2Go.Infrastructure.Implementations;
using PackFoodReady2Go.Infrastructure.Interfaces;
using Stripe;
using Stripe.Terminal;


var builder = WebApplication.CreateBuilder(args);
StripeConfiguration.ApiKey = builder.Configuration.GetValue<string>("StripeOptions:SecretKey");

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddHttpContextAccessor();

// Add services to the container.
builder.Services.AddControllersWithViews();

// Configure Stripe settings
builder.Services.Configure<StripeSettings>(builder.Configuration.GetSection("StripeSettings"));
var stripeOptions = builder.Services.BuildServiceProvider().GetRequiredService<IOptions<StripeSettings>>().Value;
StripeConfiguration.ApiKey = stripeOptions.SecretKey;


builder.Services.AddDbContext<MyAppDbContext>(options =>
	options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

    
builder.Services.AddDistributedMemoryCache(); // This is for session state
builder.Services.AddSession(options =>
{
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Adjust timeout as needed
});
builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();
builder.Services.AddScoped<IContactRepository, ContactRepository>();

builder.Services.AddScoped<IProductRepository, ProductRepository>();

builder.Services.AddRazorPages().AddViewOptions(options =>
{
	options.HtmlHelperOptions.ClientValidationEnabled = true;
});

//forgot

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseSession();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
