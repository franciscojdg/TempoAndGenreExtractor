# TempoAndGenreExtractor

This repository contains the models developed for my Master Thesis written for the Deep Learning Master I did with *Universidad de Alcalá*

## Thesis

The aim of this project was to find a good architecture for a neural network that predicts tempo and genre from short music audio clips.

The [thesis](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Memoria_TFM_DeepLearning_FranciscoJDuraGaliana.pdf) is written in Spanish but I will start adding english notebooks to describe the process.

TO DO: translate a bit of the project

## Data

Although many datasets are available only the following were useful for the current problem:
 - FMA: https://github.com/mdeff/fma
 - GTZAN: opihi.cs.uvic.ca/sound/genres.tar.gz
 - hainsworth: http://www.marsyas.info/tempo/ (also contains other useful datasets
 
 The audio files are cut into short audio clips and these are converted to frequency spectrograms so they can be processed as images and fed into a CNN
 
 ![spectrograms](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Figures/espectrogramas_db2.png)
 
 ## Models
 
 The individual models that have been tested, as well as data processing performed, are described in separate jupyter notebooks under [Modelo](https://github.com/franciscojdg/TempoAndGenreExtractor/Modelo)
 
 TO DO: describe models
 
 ### Final model
 The final model is composed of blocks of convolutions in a parallel branch structure which predicts both tempo and genre simultaneously.
 ![Final model structure](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Figures/arquitectura_mix.png)
 
 The training of this CNN can be found [here](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Modelo/Red_simple_para_prediccion_genero_y_tempo.ipynb)

 ## Results
 
TO DO: I will discuss a bit of the results here in the future

### Genre
 ![genre confusion matrix](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Figures/confusion_final_genero.png)
 
### Tempo
 ![tempo confusion matrix](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Figures/confusion_final_tempo.png)
 
 ## Bibilography
 
Sources used for this work can be found [here](https://github.com/franciscojdg/TempoAndGenreExtractor/blob/master/Master%20Thesis/Master.bib)
