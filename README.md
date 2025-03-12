Tea Subscription App - Backend ☕️
```
This is the backend API for the Tea Subscription App, built with Ruby on Rails. It provides endpoints for managing customers, teas, and subscriptions.
```
🚀 Features
```
RESTful API with Rails

Customer account management

Subscription management (subscribe/unsubscribe)

Tea catalog retrieval

JSON:API serialization for structured responses

```
📦 Tech Stack
```
Backend: Ruby on Rails (API mode)

Database: PostgreSQL

Testing: RSpec

Authentication: (Future implementation)

Serialization: JSON:API Serializer

```

📥 Installation & Setup


1️⃣ Clone the Repository

```
git clone https://github.com/yourusername/tea-subscription-be.git

cd tea-subscription-be
```

2️⃣ Install Dependencies

```
bundle install
```

3️⃣ Set Up the Database

```
rails db:create

rails db:migrate

rails db:seed
```

4️⃣ Start the Rails Server

```
rails s
```
The API should now be running at:

🔗 http://localhost:3000/api/v1


🔌 API Endpoints
```
Endpoint Description

/api/v1/customers :GET	Get all customers

/api/v1/customers/:id :GET	Get a single customer

/api/v1/customers :POST	Create a new customer

/api/v1/teas :GET	Get all teas

/api/v1/subscriptions :GET	Get all subscriptions

/api/v1/subscriptions/:id :GET	Get details of a subscription

/api/v1/subscriptions/:id :DELETE	Cancel a subscription

/api/v1/customer_subscriptions :POST	Subscribe a customer to a tea

/api/v1/customer_subscriptions :DELETE	Unsubscribe a customer from a tea
```

📂 Project Structure

```
/app
 ├── /controllers
 │   ├── api/v1/customers_controller.rb
 │   ├── api/v1/teas_controller.rb
 │   ├── api/v1/subscriptions_controller.rb
 │   ├── api/v1/customer_subscriptions_controller.rb
 │
 ├── /models
 │   ├── customer.rb
 │   ├── tea.rb
 │   ├── subscription.rb
 │   ├── customer_subscription.rb
 │   ├── customer_tea.rb
 │
 ├── /serializers
 │   ├── customer_serializer.rb
 │   ├── tea_serializer.rb
 │   ├── subscription_serializer.rb
 │
 ├── db
 │   ├── migrate/  (migrations)
 │   ├── seeds.rb
 │
 ├── spec/ (RSpec tests)
 ├── config/routes.rb
 ├── README.md
```


🛠 How to Use

1️⃣ Create a Customer

```
POST /api/v1/customers
Content-Type: application/json

{
  "customer": {
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "address": "123 Main St"
  }
}
```
2️⃣ Get Available Teas
```
GET /api/v1/teas
```
3️⃣ Subscribe a Customer to a Tea
```
POST /api/v1/customer_subscriptions
Content-Type: application/json

{
  "customer_id": 1,
  "subscription_id": 2,
  "start_date": "2025-03-12"
}
```
4️⃣ Unsubscribe from a Tea
```
DELETE /api/v1/customer_subscriptions

Content-Type: application/json

{
  "customer_id": 1,
  "subscription_id": 2
}
```

5️⃣ View All Subscriptions

```
GET /api/v1/subscriptions
```

6️⃣ Cancel a Subscription

```

DELETE /api/v1/subscriptions/1
```
🧪 Running Tests
```
This project uses RSpec for testing.

Run all tests

bundle exec rspec

Run a specific test file

bundle exec rspec spec/api/v1/customers_spec.rb

```
👨‍💻 Contributors
[Your Name] - Developer
[Other Contributors] (if applicable)


