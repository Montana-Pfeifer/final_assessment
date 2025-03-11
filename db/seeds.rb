
teas = Tea.create!(
  [
    { title: 'Earl Grey', description: 'A fragrant black tea flavored with oil of bergamot.', temperature: 200, brew_time: '5 minutes' },
    { title: 'Green Tea', description: 'A delicate tea made from unoxidized leaves, rich in antioxidants.', temperature: 175, brew_time: '2-3 minutes' },
    { title: 'Chamomile', description: 'A soothing herbal tea made from chamomile flowers.', temperature: 180, brew_time: '4 minutes' },
    { title: 'Peppermint', description: 'A refreshing herbal tea made from peppermint leaves.', temperature: 180, brew_time: '5 minutes' }
  ]
)

customers = Customer.create!(
  [
    { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', address: '123 Main St, Springfield, IL' },
    { first_name: 'Jane', last_name: 'Smith', email: 'jane.smith@example.com', address: '456 Oak St, Springfield, IL' },
    { first_name: 'Alice', last_name: 'Johnson', email: 'alice.johnson@example.com', address: '789 Pine St, Springfield, IL' },
    { first_name: 'Bob', last_name: 'Brown', email: 'bob.brown@example.com', address: '101 Maple St, Springfield, IL' }
  ]
)

subscriptions = Subscription.create!(
  [
    { title: 'Monthly Tea Subscription', price: 25.99, status: 'active', frequency: 'Monthly' },
    { title: 'Weekly Tea Subscription', price: 9.99, status: 'active', frequency: 'Weekly' },
    { title: 'Premium Tea Subscription', price: 49.99, status: 'inactive', frequency: 'Monthly' }
  ]
)

CustomerTea.create!(
  [
    { customer: customers[0], tea: teas[0], rating: 5, favorite: true, review: 'Love the bergamot flavor!' },
    { customer: customers[1], tea: teas[1], rating: 4, favorite: false, review: 'Refreshing but a bit too bitter for me.' },
    { customer: customers[2], tea: teas[2], rating: 3, favorite: true, review: 'Great for relaxing after a long day.' },
    { customer: customers[3], tea: teas[3], rating: 5, favorite: true, review: 'Perfect for a hot summer afternoon!' }
  ]
)


CustomerSubscription.create!(
  [
    { customer: customers[0], subscription: subscriptions[0], start_date: '2025-03-01', active: true },
    { customer: customers[1], subscription: subscriptions[1], start_date: '2025-03-05', active: true },
    { customer: customers[2], subscription: subscriptions[2], start_date: '2025-03-10', active: false },
    { customer: customers[3], subscription: subscriptions[0], start_date: '2025-03-15', active: true }
  ]
)

