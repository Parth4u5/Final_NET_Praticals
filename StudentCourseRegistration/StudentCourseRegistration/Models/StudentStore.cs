using System;
using System.Collections.Generic;
using System.Linq;

namespace StudentCourseRegistration.Models
{
    /// <summary>
    /// In-memory register shared by the controllers. Records live only while
    /// the application is running and reset when it restarts.
    /// </summary>
    public static class StudentStore
    {
        private static readonly List<Student> _students = new List<Student>
        {
            new Student
            {
                Id = 1,
                Name = "Aarav Sharma",
                Email = "aarav.sharma@marwadiuniversity.ac.in",
                Course = "B.Tech Computer Engineering",
                Semester = 5
            },
            new Student
            {
                Id = 2,
                Name = "Priya Patel",
                Email = "priya.patel@marwadiuniversity.ac.in",
                Course = "B.Tech Information Technology",
                Semester = 5
            },
            new Student
            {
                Id = 3,
                Name = "Rohan Mehta",
                Email = "rohan.mehta@marwadiuniversity.ac.in",
                Course = "B.Tech Computer Engineering",
                Semester = 3
            }
        };

        public static IReadOnlyList<Student> All => _students;

        public static bool EmailExists(string? email)
            => !string.IsNullOrWhiteSpace(email)
               && _students.Any(s => string.Equals(s.Email, email, StringComparison.OrdinalIgnoreCase));

        public static Student Add(Student student)
        {
            student.Id = _students.Count == 0 ? 1 : _students.Max(s => s.Id) + 1;
            _students.Add(student);
            return student;
        }
    }
}
