CREATE TABLE franchises (
  franchise_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  cuisine TEXT NOT NULL,
  total_outlets INT NOT NULL,
  status TEXT NOT NULL
);

CREATE TABLE outlets (
  outlet_id TEXT PRIMARY KEY,
  franchise_id TEXT REFERENCES franchises(franchise_id),
  outlet_name TEXT NOT NULL,
  address TEXT,
  city TEXT,
  state TEXT,
  pincode TEXT,
  status TEXT
);

CREATE TABLE food_items (
  item_id TEXT PRIMARY KEY,
  item_name TEXT NOT NULL,
  category TEXT NOT NULL,
  food_type TEXT NOT NULL,
  listed_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE outlet_menu (
  outlet_id TEXT REFERENCES outlets(outlet_id),
  item_id TEXT REFERENCES food_items(item_id),
  selling_price NUMERIC(10,2),
  available BOOLEAN,
  PRIMARY KEY(outlet_id, item_id)
);

CREATE TABLE sales (
  sale_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  item_id TEXT REFERENCES food_items(item_id),
  sale_date DATE,
  quantity INT,
  unit_price NUMERIC(10,2),
  total_amount NUMERIC(12,2),
  payment_method TEXT,
  order_channel TEXT
);

CREATE TABLE inventory (
  inventory_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  item_id TEXT REFERENCES food_items(item_id),
  current_stock INT,
  minimum_stock INT,
  maximum_stock INT,
  reorder_level INT,
  stock_status TEXT,
  last_updated DATE
);

CREATE TABLE stock_movements (
  movement_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  item_id TEXT REFERENCES food_items(item_id),
  movement_type TEXT,
  quantity INT,
  movement_date DATE,
  reference_id TEXT
);

CREATE TABLE reorders (
  reorder_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  item_id TEXT REFERENCES food_items(item_id),
  current_stock INT,
  reorder_level INT,
  recommended_quantity INT,
  priority TEXT,
  status TEXT,
  created_at DATE
);

CREATE TABLE staff (
  staff_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  name TEXT,
  role TEXT,
  joining_date DATE,
  status TEXT
);

CREATE TABLE attendance (
  attendance_id TEXT PRIMARY KEY,
  staff_id TEXT REFERENCES staff(staff_id),
  date DATE,
  status TEXT,
  hours_worked NUMERIC(4,1)
);

CREATE TABLE marketing_campaigns (
  campaign_id TEXT PRIMARY KEY,
  franchise_id TEXT REFERENCES franchises(franchise_id),
  campaign_name TEXT,
  campaign_type TEXT,
  start_date DATE,
  end_date DATE,
  budget NUMERIC(12,2),
  impressions INT,
  clicks INT,
  conversions INT,
  revenue_generated NUMERIC(12,2),
  roi_pct NUMERIC(10,2)
);

CREATE TABLE outlet_performance (
  performance_id TEXT PRIMARY KEY,
  outlet_id TEXT REFERENCES outlets(outlet_id),
  period TEXT,
  revenue NUMERIC(12,2),
  previous_revenue NUMERIC(12,2),
  target_revenue NUMERIC(12,2),
  orders INT,
  customers INT,
  revenue_growth NUMERIC(8,2),
  target_achievement NUMERIC(8,2),
  aov NUMERIC(10,2),
  health_score INT,
  performance_status TEXT
);
