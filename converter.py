import json

with open('5e-SRD-Magic-Schools.json') as json_file:
  data = json.load(json_file)
  # w -> write  + -> Create file if not exists
  f = open("schools.csv", "w+")
  for p in data:
    f.write(str(p["index"]) + "&&" + p["name"] + "&&" + p["desc"] + "\n")

  f.close()
  

with open('5e-SRD-Spells.json') as json_file:
  data = json.load(json_file)

  f = open("spells.csv", "w+")
  for p in data:
    string = str(p["index"]) + '&&' + p["name"] + '&&'

    if "desc" in p:
      for desc in p["desc"]:
        string += desc

    string += '&&'

    if "higher_level" in p:
      for high in p["higher_level"]:
        string += high

    string += '&&'

    if "page" in p:
      string += p["page"]

    string += '&&'

    if "material" in p:
      string += p["material"]

    string += '&&'

    if "ritual" in p:
      if p["ritual"]:
        string += str(1)
      else:
        string += str(0)
    
    string += '&&'

    if "duration" in p:
      string += str(p["duration"])

    string += '&&'

    if "concentration" in p:
      if p["concentration"]:
        string += str(1)
      else:
        string += str(0)

    string += '&&'

    if "school" in p:
      with open('5e-SRD-Magic-Schools.json') as file:
        schools = json.load(file)

        for s in schools:
          if s["name"] == p["school"]["name"]:
            string += str(s["index"])

    string += '&&'

    if "level" in p:
      string += str(p["level"])

    string += '&&'

    if "range" in p:
      string += p["range"]
    
    string += '&&'

    if "casting_time" in p:
      string += str(p["casting_time"])

    f.write(string + "\n")
  f.close()
    

# TODO: Make new spell db design

# Spell -> id, name, desc, higher_level, page, range, material, ritual, duration, concentration, casting_time, level, school(FK)

# DB ADD components
# spells, school, spellComponents