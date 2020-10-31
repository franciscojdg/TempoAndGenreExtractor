# -*- coding: utf-8 -*-
"""
Created on Sat Aug 31 18:36:50 2019

@author: franc
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import librosa
import os


def read_data(src_dir, genres, song_samples, spec_format, debug = True):    
    # Inicializar listas de salida
    arr_specs = []
    arr_genres = []

    # Leer todos los ficheros en el directorio (cada género en una carpeta)
    for x,_ in genres.items():
        folder = src_dir  + "/" +  x

        # Por cada carpeta dentro de cada género
        for root, subdirs, files in os.walk(folder):
            
            # por cada archivo en cada carpeta
            for file in files:
                # Leer audio del archivo
                file_name = folder + "/" + file
                signal, sr = librosa.load(file_name)
                signal = signal[:song_samples]
                # Indicador cuando debug está activo
                if debug:
                    print("Audio Shape: {}".format(signal.shape))
                
                
                # Indicador cuando debug está activo
                if debug:
                    print("Reading file: {}".format(file_name))
                
                # Partir canciones en audios mas pequeños
                signals, y = splitsongs(signal, genres[x])
                if debug:
                    print("Audio Shape: {}".format(signals.shape))
                
                # Convertir audio con la función definida (se utilizará la función de espectrograma)
                specs = spec_format(signals)
                
                # Almacenar espectrogramas y etiquetas
                arr_genres.extend(y)
                arr_specs.extend(specs)
                        
    return np.array(arr_specs), np.array(arr_genres)


def splitsongs(X, y, window = 0.1, overlap = 0.5):
    # inicializar salidas
    temp_X = []
    temp_y = []

    xshape = X.shape[0] # tamaño del audio
    chunk = int(xshape*window) # tamaño de los audios de salida
    offset = int(chunk*(1.-overlap)) # offset donde cortar siguiente audio
    
    # Cortar cancion en trozos teniendo en cuenta los tamaños original y de salida y el offset
    spsong = [X[i:i+chunk] for i in range(0, xshape - chunk + offset, offset)]
    
    # Crear lista de salida con cortes de la cancion y target correspondiente
    for s in spsong:
        temp_X.append(s)
        temp_y.append(y)

    return np.array(temp_X), np.array(temp_y)


def to_melspectrogram(songs, n_fft = 1024, hop_length = 512):
    # función de transformación
    melspec = lambda x: librosa.feature.melspectrogram(x, n_fft = n_fft, hop_length = hop_length)[:,:,np.newaxis]

    # aplicar transformación a todas las canciones de entrada
    tsongs = map(melspec, songs)
    return np.array(list(tsongs))



#gtzan_dir = r"D:\Users\franc\Documents\IMF - Deep Learning\Trabajo Master\Datasets\GTZAN\genres"
#test_dir = r"D:\Users\franc\Documents\IMF - Deep Learning\Trabajo Master\Datasets\test"
#
#song_samples = 550000
#genres = {'metal': 0, 'disco': 1, 'classical': 2, 'hiphop': 3, 'jazz': 4, 
#          'country': 5, 'pop': 6, 'blues': 7, 'reggae': 8, 'rock': 9}
#
#genres = {'rock':9}
#
#X, y = read_data(gtzan_dir, genres, song_samples, to_melspectrogram, debug=True)
    

## Simple Directories
root_dict = {"acm": r"Datasets\acm_mirum",
             "hainsworth": r"Datasets\hainsworth",
             "gtzan": r"Datasets\GTZAN"
             }

meta_file_dict = {"acm": r"\acm_mirum_tempos.mf",
             "hainsworth": r"\hains_tempos.mf",
             "gtzan": r"\collections\genres_tempos.mf"
             }
 
data_file_dict = {"acm": r"\acm_mirum_tempo",
             "hainsworth": r"\wavs",
             "gtzan": r"\genres",
             }
 
df_dict = {}

for dataset in root_dict.keys():
    root_path = root_dict[dataset]          
    meta_file = meta_file_dict[dataset]    
    data_file = data_file_dict[dataset]      
    
    df = pd.read_csv(root_path+meta_file,
                         delimiter="\t",header=None
                         ).rename(columns={0:"filepath",1:"tempo"})
    
    filelist = os.listdir(root_path+data_file)
    
    df["fullpath"] = root_path+"/"+df.filepath
    
    for index,row in df.iterrows():
        
        fullpath = root_path + "/" + row.filepath
        
        file = row.fullpath.split("/")[-1] in filelist
        
        df.loc[index,"check"] = file
        
        
    if dataset == "hainsworth":
        df_genres = pd.read_csv(r"Datasets\hainsworth\hairns_data.txt",
        usecols=["idx","style"])
        df_genres = df_genres.replace({"style":{"Choral":"Classical","ClassicalSolo":"Classical",
                                                "BigBand":"Jazz","Folk2":"Folk"}})
        dir_path = df.iloc[0].fullpath[:-7]
        df_genres["fullpath"] = dir_path+df_genres.idx
        df_genres = df_genres.rename(columns={"style":"genre"})
        df = df.merge(df_genres[["fullpath","genre"]], how='left', on="fullpath")
        
    if dataset== "gtzan":
        df["genre"] = df.filepath.str.split("/").str[0]
        
    if dataset=="acm":
        df["genre"]=None
        
    df_dict[dataset] = df


# FMA:
df = pd.read_csv(r"Datasets\FMA\tracks_small.csv",
                 header=1,usecols=["track_id","genre_top"]).rename(columns={"genre_top":"genre"})
echonest = pd.read_csv(r"Datasets\FMA\fma_metadata\echonest.csv",
                       header=2,usecols=["track_id","tempo"])
root_dir = r"Datasets\FMA\fma_small"
df['filename'] = df.track_id.astype(str).str.zfill(6)+".wav"
df["fullpath"] = root_dir + "/" + df["filename"].str[:3] + "/" + df["filename"]
df['check'] = True
df_dict["fma"] = df.merge(echonest, how='left', on="track_id")

for dataset in df_dict.keys():
    df_dict[dataset]["dataset"] = dataset
    print(df_dict[dataset].columns)

df = pd.concat([df_dict[dataset][["fullpath","tempo","genre","dataset","check"]] for dataset in df_dict.keys()])

df = df.replace({"genre":{"blues":"Blues","classical":"Classical","country":"Country",
                          "disco":"Disco","hiphop":"Hip-Hop","rock":"Rock","pop":"Pop",
                          "jazz":"Jazz"}})
df_full = df.dropna()
df_tempo = df.drop("genre",axis=1).dropna()
df_genre = df.drop("tempo",axis=1).dropna()

df[["genre","check"]].groupby("genre").count()



