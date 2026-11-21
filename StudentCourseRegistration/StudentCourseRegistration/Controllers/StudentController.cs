using Microsoft.AspNetCore.Mvc;
using StudentCourseRegistration.Models;

namespace StudentCourseRegistration.Controllers
{
    public class StudentController : Controller
    {
        // GET: /Student or /Student/Index
        public IActionResult Index()
        {
            return View(StudentStore.All);
        }

        // GET: /Student/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: /Student/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Student student)
        {
            var email = student.Email?.Trim();

            if (!string.IsNullOrEmpty(email) && StudentStore.EmailExists(email))
            {
                ModelState.AddModelError(nameof(Student.Email), "This email is already registered.");
            }

            if (ModelState.IsValid)
            {
                student.Name = student.Name?.Trim() ?? string.Empty;
                student.Course = student.Course?.Trim() ?? string.Empty;
                student.Email = email ?? string.Empty;

                StudentStore.Add(student);

                TempData["SuccessMessage"] = $"{student.Name} has been added to the register.";

                return RedirectToAction(nameof(Index));
            }

            return View(student);
        }

        // GET: /Student/Details/{id}
        public IActionResult Details(int id)
        {
            var student = StudentStore.All.FirstOrDefault(s => s.Id == id);
            if (student == null)
            {
                return NotFound();
            }

            return View(student);
        }
    }
}
