import random

# Define races and their corresponding HP ranges
races = ["Human", "Elf", "Dwarf", "Orc"]
race_hp_ranges = {
    "Human": (50, 80),
    "Elf": (40, 60),
    "Dwarf": (60, 90),
    "Orc": (70, 100)
}

# Generate a random name (you can implement this part)
name = input("Enter your character's name: ")

# Choose a race
print("Choose a race:")
for i, race in enumerate(races):
    print(f"{i + 1}. {race}")
race_choice = int(input("Enter the number of your chosen race: ")) - 1
chosen_race = races[race_choice]

# Generate random HP based on the chosen race
min_hp, max_hp = race_hp_ranges[chosen_race]
hp = random.randint(min_hp, max_hp)

# Generate a random physical weapon and damage
physical_weapon = "Sword"  # You can expand the list of possible weapons
physical_damage = random.randint(10, 20)

# Generate a random magic type and damage
magic_types = ["Fire", "Ice", "Lightning"]  # You can expand the list of magic types
magic_type = random.choice(magic_types)
magic_damage = random.randint(5, 15)

# Roll D6 for strength and magic modifiers
def roll_d6():
    return random.randint(1, 6)

strength_mod = roll_d6() % 2  # Even -> +1, Odd -> -1
magic_mod = roll_d6() % 2  # Even -> +1, Odd -> -1

# Print character stats
print(f"\nCharacter Stats for {name}:")
print(f"Name: {name}")
print(f"Race: {chosen_race}")
print(f"HP: {hp}")
print(f"Physical Weapon: {physical_weapon}")
print(f"Physical Weapon Damage: {physical_damage}")
print(f"Magic Type: {magic_type}")
print(f"Magic Damage: {magic_damage}")
print(f"Strength Modifier: {strength_mod}")
print(f"Magic Modifier: {magic_mod}")
