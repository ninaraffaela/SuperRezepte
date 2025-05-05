/*
  # Insert Initial Recipe Data

  1. Data Insertion
    - Insert categories
    - Insert recipes
    - Insert ingredients

  This migration populates the database with the initial recipe data from the CSV files.
*/

-- Insert categories
INSERT INTO categories (id, name, created_at)
VALUES 
  ('94be389b-98aa-4029-9a98-45c4461c251f', 'Pancakes', '2025-05-01 09:00:00+00'),
  ('7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Heisse Schokolade', '2025-05-01 09:00:00+00');

-- Insert recipes
INSERT INTO recipes (name, description, servings, instructions, category_id, created_at)
VALUES 
  (
    'Pancakes',
    'Ein tolles Rezept für ein morgendliches Essen mit Freunden.',
    4,
    '1. Alle trockenen Zutaten in einer Schüssel vermischen
2. In einer separaten Schüssel Milch, Eier und Butter verquirlen
3. Flüssige zu trockenen Zutaten geben und glatt rühren
4. Teig 10 Minuten ruhen lassen
5. Butter in einer Pfanne erhitzen
6. Pro Pancake etwa 1/4 Tasse Teig in die Pfanne geben
7. Wenden, wenn Blasen entstehen
8. Mit Ahornsirup und frischen Früchten servieren',
    '94be389b-98aa-4029-9a98-45c4461c251f',
    '2025-05-01 09:00:00+00'
  ),
  (
    'Heisse Schokolade',
    'Ein tolles Rezept für ein morgendliches Essen mit Freunden.',
    2,
    '1. Milch in einem Topf langsam erwärmen
2. Schokolade klein hacken
3. Schokolade in warme Milch geben und schmelzen lassen
4. Ständig rühren bis die Mischung glatt ist
5. Mit Schlagsahne und Marshmallows garnieren',
    '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6',
    '2025-05-01 09:00:00+00'
  );

-- Insert ingredients
INSERT INTO ingredients (id, recipe_id, name, quantity, unit, additional_info, created_at)
SELECT 
  id::uuid,
  recipe_id::uuid,
  name,
  quantity::decimal,
  unit,
  additional_info,
  created_at::timestamptz
FROM (VALUES
  ('f8c12e45-9b23-4d78-a123-456789abcdef', '94be389b-98aa-4029-9a98-45c4461c251f', 'Mehl', 200, 'g', 'Type 405', '2025-05-01T09:00:00Z'),
  ('a7b34d12-8c56-4e90-b234-567890bcdef1', '94be389b-98aa-4029-9a98-45c4461c251f', 'Zucker', 50, 'g', 'fein', '2025-05-01T09:00:00Z'),
  ('c6d45e23-7f89-4a12-c345-678901cdef12', '94be389b-98aa-4029-9a98-45c4461c251f', 'Backpulver', 8, 'g', NULL, '2025-05-01T09:00:00Z'),
  ('e5f67g34-6h90-4b23-d456-789012defg23', '94be389b-98aa-4029-9a98-45c4461c251f', 'Salz', 4, 'g', 'Meersalz', '2025-05-01T09:00:00Z'),
  ('b4c56d78-5e90-4f12-e567-890123efgh34', '94be389b-98aa-4029-9a98-45c4461c251f', 'Milch', 300, 'ml', 'Vollmilch', '2025-05-01T09:00:00Z'),
  ('d3e45f67-4g89-4h12-f678-901234fghi45', '94be389b-98aa-4029-9a98-45c4461c251f', 'Eier', 2, 'Stück', 'Raumtemperatur', '2025-05-01T09:00:00Z'),
  ('g2h34i56-3j78-4k90-g789-012345ghij56', '94be389b-98aa-4029-9a98-45c4461c251f', 'Butter', 60, 'g', 'geschmolzen', '2025-05-01T09:00:00Z'),
  ('i1j23k45-2l67-4m89-h890-123456hijk67', '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Vollmilch', 500, 'ml', NULL, '2025-05-01T09:00:00Z'),
  ('k0l12m34-1n56-4o78-i901-234567ijkl78', '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Zartbitterschokolade', 200, 'g', '70% Kakao', '2025-05-01T09:00:00Z'),
  ('m9n01o23-0p45-4q67-j012-345678jklm89', '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Zucker', 30, 'g', 'nach Geschmack', '2025-05-01T09:00:00Z'),
  ('o8p90q12-9r34-4s56-k123-456789klmn90', '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Schlagsahne', 100, 'ml', 'optional', '2025-05-01T09:00:00Z'),
  ('q7r89s01-8t23-4u45-l234-567890lmno01', '7b1c6136-b05a-4f11-847e-b74e1a9d7ed6', 'Marshmallows', 30, 'g', 'optional', '2025-05-01T09:00:00Z')
) AS t (id, recipe_id, name, quantity, unit, additional_info, created_at);