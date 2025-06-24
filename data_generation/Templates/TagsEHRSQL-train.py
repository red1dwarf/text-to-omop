import json

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/mimic_iii/train.json", "r") as f:
    data1 = json.load(f)

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/mimic_iii/valid.json", "r") as af:
    data2 = json.load(af)

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/mimic_iii/test.json", "r") as bf:
    data3 = json.load(bf)

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/eicu/train.json", "r") as cf:
    data4 = json.load(cf)

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/eicu/valid.json", "r") as df:
    data5 = json.load(df)

with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/eicu/test.json", "r") as ef:
    data6 = json.load(ef)

with open("C:/Users/paule/Downloads/annotated_train.json", "r") as ff:
    data7 = json.load(ff)

with open("C:/Users/paule/Downloads/annotated_valid.json", "r") as gf:
    data8 = json.load(gf)

with open("C:/Users/paule/Downloads/annotated_test.json", "r") as hf:
    data9 = json.load(hf)


# train_questions = set()
# for entry in train_data:
#     impossible = entry.get("is_impossible")
#     if impossible == True:
#         quest = entry.get("question")
#         if quest:
#             train_questions.add(quest)

# identiccal_questions = set()
# new_questions = set()
# for entry in test_data:
#     impossible = entry.get("is_impossible")
#     if impossible == True:
#         quest = entry.get("question")
#         if quest and quest not in train_questions:
#             new_questions.add(quest)
#         elif quest and quest in train_questions:
#             identiccal_questions.add(quest)


# with open("C:/Users/paule/Documents/IHI/EHRSQL/dataset/ehrsql/eicu/train.json", "r", encoding="utf-8") as f_valid:
#     valid_data = json.load(f_valid)



# set1 = set()
# for entry in data1:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest :
#             set1.add(quest)
# for entry in data2:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest :
#             set1.add(quest)
# for entry in data3:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest :
#             set1.add(quest)

# set2 = set()
# for entry in data4:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest and quest not in set1:
#             set2.add(quest)
# for entry in data5:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest and quest not in set1:
#             set2.add(quest)
# for entry in data6:
#     tag = entry.get("is_impossible")
#     if tag == True:
#         quest = entry.get("question").lower()
#         if quest and quest not in set1:
#             set2.add(quest)

# set3 = set()
# for entry in data7:
#     tag = entry.get("query")
#     if tag == "null":
#         quest = entry.get("question").lower()
#         if quest and quest not in set1 and tag not in set2:
#             set3.add(quest)
# for entry in data8:
#     tag = entry.get("query")
#     if tag == "null":
#         quest = entry.get("question").lower()
#         if quest and quest not in set1 and tag not in set2:
#             set3.add(quest)
# for entry in data9:
#     tag = entry.get("query")
#     if tag == "null":
#         quest = entry.get("question").lower()
#         if quest and quest not in set1 and tag not in set2:
#             set3.add(quest)

set1 = set()
for entry in data1:
    tag = entry.get("q_tag")
    if tag :
        set1.add(tag)
for entry in data2:
    tag = entry.get("q_tag")
    if tag :
        set1.add(tag)
for entry in data3:
    tag = entry.get("q_tag")
    if tag :
        set1.add(tag)

set2 = set()
for entry in data4:
    tag = entry.get("q_tag")
    if tag and tag not in set1:
        set2.add(tag)
for entry in data5:
    tag = entry.get("q_tag")
    if tag and tag not in set1:
        set2.add(tag)
for entry in data6:
    tag = entry.get("q_tag")
    if tag and tag not in set1:
        set2.add(tag)

set3 = set()
for entry in data7:
    tag = entry.get("template").lower()
    if tag and tag != "-" and tag not in set1 and tag not in set2:
        set3.add(tag)
for entry in data8:
    tag = entry.get("template").lower()
    if tag and tag != "-" and tag not in set1 and tag not in set2:
        set3.add(tag)
for entry in data9:
    tag = entry.get("template").lower()
    if tag and tag != "-" and tag not in set1 and tag not in set2:
        set3.add(tag)




output_path = "C:/Users/paule/Documents/IHI/Dataset/Unanswerables/TEMPLATES_EHRSQL_mimic.txt"

with open(output_path, "w", encoding="utf-8") as out_file:
    for tag in set1:
        out_file.write(tag + "\n")

output_path2 = "C:/Users/paule/Documents/IHI/Dataset/Unanswerables/TEMPLATES_EHRSQL_mimic_eicu.txt"

with open(output_path2, "w", encoding="utf-8") as out_file2:
    for tag in set2:
        out_file2.write(tag + "\n")

output_path3 = "C:/Users/paule/Documents/IHI/Dataset/Unanswerables/TEMPLATES_EHRSQL2024.txt"

with open(output_path3, "w", encoding="utf-8") as out_file3:
    for tag in set3:
        out_file3.write(tag + "\n")


print(len(set1), len(set2), len(set3))



# set2 = set()
# for entry in data2:
#     tag = entry.get("q_tag").lower()
#     if tag and tag not in set1:
#         set2.add(tag)

# set3 = set()
# for entry in data3:
#     tag = entry.get("q_tag").lower()
#     if tag and tag not in 
#         set3.add(tag)


# same = set()
# new_tags = set()
# for entry in test_data:
#     tag = entry.get("template").lower()
#     if tag and tag not in train_tags:
#         new_tags.add(tag)
#     elif tag and tag in train_tags:
#         same.add(tag)

# output_path = "C:/Users/paule/Documents/IHI/Dataset/EHRSQL2024templates_valid.txt"

# with open(output_path, "w", encoding="utf-8") as out_file:
#     for tag in new_tags:
#         out_file.write(tag + "\n")

# print(f"\nTotal unique tags: {len(train_tags), len(new_tags), len(same)}")
