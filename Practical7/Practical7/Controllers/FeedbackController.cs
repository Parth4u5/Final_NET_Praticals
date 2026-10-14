using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web.Mvc;
using Practical7.Models;

namespace Practical7.Controllers
{
    public class FeedbackController : Controller
    {
        private static readonly List<Feedback> _store = new List<Feedback>();
        private static int _nextId = 1;

        public ActionResult Index()
        {
            var list = _store.OrderByDescending(f => f.SubmittedAt).ToList();
            return View(list);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Feedback model)
        {
            if (!ModelState.IsValid)
                return View(model);

            model.Id = Interlocked.Increment(ref _nextId);
            model.SubmittedAt = DateTime.UtcNow;

            lock (_store)
            {
                _store.Add(model);
            }

            return RedirectToAction("ThankYou");
        }

        public ActionResult ThankYou()
        {
            return View();
        }
    }
}
