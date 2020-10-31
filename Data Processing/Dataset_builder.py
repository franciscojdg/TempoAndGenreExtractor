# -*- coding: utf-8 -*-
"""
Created on Sun Sep  1 10:33:10 2019

@author: franc
"""

import pandas as pd

df_acm = pd.read_csv(r"D:\Users\franc\Documents\IMF - Deep Learning\Trabajo Master\Datasets\acm_mirum\acm_mirum_tempos.mf",
                     delimiter="\t",header=None).rename(columns={0:"filepath",1:"tempo"})
