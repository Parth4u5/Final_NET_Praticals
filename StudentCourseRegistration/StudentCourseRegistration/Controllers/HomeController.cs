using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using StudentCourseRegistration.Models;

namespace StudentCourseRegistration.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        var students = StudentStore.All;

        ViewBag.StudentCount = students.Count;
        ViewBag.ProgramCount = students.Select(s => s.Course).Distinct().Count();
        ViewBag.SemesterCount = students.Where(s => s.Semester.HasValue)
                                        .Select(s => s.Semester!.Value)
                                        .Distinct()
                                        .Count();

        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
