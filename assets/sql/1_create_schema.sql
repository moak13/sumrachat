CREATE TABLE IF NOT EXISTS user(
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  is_authenticated INTEGER,
  image TEXT
);

CREATE TABLE IF NOT EXISTS conversations(
  id INTEGER PRIMARY KEY,
  full_name TEXT,
  first_name TEXT,
  last_name TEXT,
  image TEXT,
  user_id INTEGER,
  sent_message TEXT,
  date_time TEXT,
  is_me INTEGER
);

CREATE TABLE IF NOT EXISTS messages(
  id INTEGER PRIMARY KEY,
  full_name TEXT,
  first_name TEXT,
  last_name Text,
  image TEXT,
  user_id INTEGER,
  sent_message TEXT,
  date_time TEXT
);

CREATE TABLE IF NOT EXISTS bot(
  id INTEGER PRIMARY KEY,
  full_name TEXT,
  image TEXT,
  user_id INTEGER,
  reply TEXT,
  date_time TEXT
);