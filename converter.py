import json

# --- Magic Schools ---
def write_schools():
  json_file = open('data/5e-SRD-Magic-Schools.json')
  data = json.load(json_file)
  json_file.close()

  # w -> write  + -> Create file if not exists
  f = open("db_csv/schools.csv", "w+")
  for p in data:
    f.write((str(p["index"]) + "&&" + p["name"] + "&&" + p["desc"] + "\n").encode('utf-8'))

  f.close()


# --- Languages ---
def write_languages():
  json_file = open('data/5e-SRD-Languages.json')
  data = json.load(json_file)
  json_file.close()

  f = open("db_csv/languages.csv", "w+")
  for p in data:
    f.write((str(p["index"]) + "&&" + p["name"] + "&&" + p["type"] + "&&" + str(p["script"]) + "\n").encode('utf-8'))
  
  f.close()


# --- Races ---
def write_races():
  json_file = open('data/5e-SRD-Races.json')
  data = json.load(json_file)
  json_file.close()

  f = open("db_csv/races.csv", "w+")
  for p in data:
    f.write((str(p["index"]) + "&&" + p["name"] + "&&" + str(p["speed"]) + "&&" + p["alignment"] + "&&" + p["size"] + "&&" + p["size_description"] + "\n").encode('utf-8'))
  
  f.close()


# --- Race Languages ---
def write_race_languages():
  json_file = open('data/5e-SRD-Languages.json')
  languages = json.load(json_file)
  json_file.close()

  f = open('db_csv/raceLanguages.csv', 'w+')

  for l in languages:
    line = str(l["index"]) + "&&"

    for ls in l["typical_speakers"]:
      f.write((line + ls + "\n").encode('utf-8'))

  f.close()


# --- Spells ---
def write_spells():
  def delim(val):
    val += '&&'

  json_file = open('data/5e-SRD-Spells.json')
  data = json.load(json_file)
  json_file.close()

  f = open("db_csv/spells.csv", "w+")
  for p in data:
    string = str(p["index"]) + '&&' + p["name"] + '&&'

    if "desc" in p:
      for desc in p["desc"]:
        string += desc

    delim(string)

    if "higher_level" in p:
      for high in p["higher_level"]:
        string += high

    delim(string)

    if "page" in p:
      string += p["page"]

    string += '&&'

    if "material" in p:
      string += p["material"]

    delim(string)

    if "ritual" in p:
      if p["ritual"]:
        string += str(1)
      else:
        string += str(0)
    
    delim(string)

    if "duration" in p:
      string += str(p["duration"])

    delim(string)

    if "concentration" in p:
      if p["concentration"]:
        string += str(1)
      else:
        string += str(0)

    delim(string)

    if "school" in p:
      with open('data/5e-SRD-Magic-Schools.json') as file:
        schools = json.load(file)

        for s in [sc for sc in schools if s["name"] == p["school"]["name"]]:
          string += str(s["index"])

    delim(string)

    if "level" in p:
      string += str(p["level"])

    delim(string)

    if "range" in p:
      string += p["range"]
    
    delim(string)

    if "casting_time" in p:
      string += str(p["casting_time"])

    f.write(string.encode('utf-8') + "\n")

  f.close()


if __name__ == "__main__":
  write_schools()
  write_languages()
  write_races()
  write_race_languages()
  write_spells()
