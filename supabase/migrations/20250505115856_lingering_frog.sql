/*
  # Recipe Database Schema

  1. New Tables
    - `categories`
      - `id` (uuid, primary key)
      - `name` (text)
      - `created_at` (timestamp)
    
    - `recipes`
      - `id` (uuid, primary key)
      - `name` (text)
      - `description` (text)
      - `servings` (integer)
      - `instructions` (text)
      - `category_id` (uuid, foreign key)
      - `created_at` (timestamp)
    
    - `ingredients`
      - `id` (uuid, primary key)
      - `recipe_id` (uuid, foreign key)
      - `name` (text)
      - `quantity` (decimal)
      - `unit` (text)
      - `additional_info` (text)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for public read access
*/

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create recipes table
CREATE TABLE IF NOT EXISTS recipes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  servings integer NOT NULL DEFAULT 1,
  instructions text NOT NULL,
  category_id uuid REFERENCES categories(id),
  created_at timestamptz DEFAULT now()
);

-- Create ingredients table
CREATE TABLE IF NOT EXISTS ingredients (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  recipe_id uuid REFERENCES recipes(id) ON DELETE CASCADE,
  name text NOT NULL,
  quantity decimal NOT NULL,
  unit text NOT NULL,
  additional_info text,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE ingredients ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Allow public read access on categories"
  ON categories
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Allow public read access on recipes"
  ON recipes
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Allow public read access on ingredients"
  ON ingredients
  FOR SELECT
  TO public
  USING (true);