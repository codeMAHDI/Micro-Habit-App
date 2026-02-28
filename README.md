# 🚀 MicroHabit Challenge

**MicroHabit Challenge** holo ekta premium, gamified habit-tracking mobile application jeta **Flutter** diye banano hoyeche. Eta user-der-ke choto choto step-er madhyome boro lokkhye pouchate ebong utpadonshilota-ke ekta mojar obhiggyotay porinito korte sahayyo kore.

---

## ✨ Mul Feature-gulo

### 1. 🏠 Home Alternative (Doinik Lifestyle Summary)
Eta holo prothom landing page jekhane user tader lifestyle-er ekta summary dekhte pay.
* **Doinik Metric:** Hydration ebong steps-er real-time tracking.
* **Up Next:** Stay organized thakar jonno poroborti kaj-gulo ek-nojore dekhar sujog.
* **Streak Banner:** Consistency dhore rakhar jonno motivational streak banner.

### 2. ⚡ Home Dashboard (Action Center)
Specific challenge-gulo somponno korar jonno ekta dedicated environment.
* **Active Challenge:** Bortoman micro-habit-er jonno dynamic progress indicator.
* **Gamified Feedback:** Session sesh kore point earn kora ebong level-up korar sujog.

### 3. 📊 Premium Analytics
Dark-themed UI-er madhyome user-er performance-er bistarito tottho.
* **Success Rate:** Habit somponno korar aggregated statistics.
* **Visual Progress:** Somoyer sathe consistency track korar jonno interactive charts.

### 4. 👤 Rewards & Profile
Rewards-er upor vitti kore personalized profile management.
* **Badge System:** Progotir sathe sathe bibhinn badge unlock kora.
* **Point Redemption:** Micro-habit somponno kore point joma kora.

---

## 🛠 Tech Stack & Architecture

* **Framework:** Flutter
* **State Management:** GetX
* **Architecture Pattern:** MVVM (Model-View-ViewModel)
* **UI/UX:** Soft gradients ebong smooth micro-interactions-er sathe premium Glassmorphism design.
* **Responsiveness:** `flutter_screenutil` babohar kore multi-device support.

---

## 📂 Project Structure

Project-ti modularized folder structure follow kore:

```text
lib/
├── core/           # Routes ebong Dependency Injection
├── data/           # API ebong Storage layer (Models, Repositories)
├── utils/          # Constants, Themes, ebong App Assets
└── view/
    ├── components/ # Reusable UI widgets (GlassCard, CustomButton)
    └── screen/     # Feature-wise modules (Auth, Home, Stats, Profile)