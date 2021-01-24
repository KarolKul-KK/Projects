from keras.datasets import boston_housing
import numpy as np
from keras import layers
from keras import models


(train_data, train_targets), (test_data, test_targets) = boston_housing.load_data()

# Normalize data
mean = train_data.mean(axis=0)
train_data -= mean
std = train_data.std(axis=0)           
train_data /= std

test_data -= mean
test_data /= std      

# Function to build a model, we got small database se we use small model
def build_model():
    model = models.Sequential()
    model.add(layers.Dense(64, activation='relu', input_shape=(train_data.shape[1],)))
    model.add(layers.Dense(64, activation='relu'))
    model.add(layers.Dense(1)) # no activation function becouse we want to get any value

    model.compile(optimizer='rmsprop', loss='mse', metrics=['mae'])
    return model


# k fold validation 
k = 4
num_val_samples = len(train_data) // k
num_epochs = 100
all_scores = []
for i in range(k):
    print('processing fold #', i)
    val_data = train_data[i * num_val_samples: (i + 1) * num_val_samples]
    val_targets = train_targets[i * num_val_samples: (i + 1) * num_val_samples]

    partial_train_data = np.concatenate(
        [train_data[:i * num_val_samples],
        train_data[(i + 1) * num_val_samples:]],
        axis=0)
    partial_train_targets = np.concatenate(
        [train_targets[:i * num_val_samples],
        train_targets[(i + 1) * num_val_samples:]]
        axis=0)

# Let's run the model
model = build_model()
model.fit(train_data, train_targets,
        epochs=80, batch_size=16)

test_mse_score, test_mae_score = model.evaluate(test_data, test_targets)
print('The daviation is: ', test_mae_score)
print("It means that got model can predict price with and accuracy of up to", np.around(test_mae_score, decimals=1), "k$")