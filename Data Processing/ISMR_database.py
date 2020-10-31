# -*- coding: utf-8 -*-
"""
Created on Sat Aug 31 09:31:30 2019

@author: franc
"""

import requests
import pandas as pd

url = 'https://github.com/ismir/mir-datasets/blob/master/outputs/data-sets.md'

header = {
  "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.75 Safari/537.36",
  "X-Requested-With": "XMLHttpRequest"
}

r = requests.get(url, headers=header)

df = pd.read_html(r.text)[0]


df = df[df["with audio"]!="no"]

df["genre"] = df["meta data"].str.contains("genre").fillna(False)
df["tempo"] = df["meta data"].str.contains("tempo").fillna(False)

df_genre = df[df.genre]
df_tempo = df[df.tempo]

df_genre_and_tempo = df[df.genre & df.tempo]

