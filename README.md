# Wildlife Explorer Rails

Wildlife Explorer is a Ruby on Rails application that catalogs animals, their habitats, and observations. It integrates data from multiple sources (CSV and Faker) and features search, pagination, hierarchical navigation, and an interactive map (using Leaflet.js).

---

## Overview

- **Data Sources:**  
  - CSV files for Animals and Habitats  
  - Faker-generated Observations

- **Core Features:**  
  - ActiveRecord models with associations and validations  
  - ER diagram and database design (Animal, Habitat, Observation, AnimalHabitat)  
  - Responsive UI with a Bootstrap navbar and custom jungle-inspired styling  
  - Collection and detailed member pages for Animals, Habitats, and Observations  
  - Search and filter functionality on the Animals index  
  - A dedicated interactive map page using Leaflet.js

---

## Features Implemented

1. **Database & Models**  
   - Three data sources: CSV for Animals and Habitats, Faker for Observations  
   - ERD illustrating relationships among Animal, Habitat, Observation, and AnimalHabitat  
   - ActiveRecord models with appropriate associations and validations

2. **Navigation & UI**  
   - About page explaining data sources and project overview  
   - Bootstrap navbar linking to Home, About, Animals, Habitats, Observations, and Map

3. **Data Presentation & User Experience**  
   - Index and show pages for Animals, Habitats, and Observations  
   - Hierarchical navigation (e.g., habitat details showing associated animals)  
   - Pagination using Kaminari  
   - Interactive mapping using Leaflet.js

4. **Search & Filtering**  
   - Text search on the Animals index page (case-insensitive)  
   - Dropdown filtering by classification

5. **Styling & UI Enhancements**  
   - Valid HTML5 and ERB conditionals for dynamic messages  
   - Responsive layout using Bootstrap’s grid system with custom CSS

6. **Version Control**  
   - Tracked with Git on GitHub with 20+ descriptive commits

---

## How to Run the Project

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/Zzisan/Wildlife-Explorer-Rails.git
   cd Wildlife-Explorer-Rails

bundle install

rails db:setup

rails server

Open in Your Browser: Visit http://localhost:3000 to explore the application.

