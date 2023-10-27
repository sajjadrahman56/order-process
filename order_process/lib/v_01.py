# library 
import os
import json
import torch 
from PIL import Image
from torch.utils.data import Dataset, random_split, DataLoader
from torchvision import transforms
import matplotlib.pyplot as plt
import numpy as np

# Load the metadata 
with open('/content/data/metadata.jsonl', 'r') as file:
    metadata = [json.loads(line) for line in file]

# Convert to a list of tuples (image path, label)
data = [(item['file_name'], item['text_prompt']) for item in metadata]

# Define a custom dataset
class CustomDataset(Dataset):
    def __init__(self, data, transform=None):
        self.data = data
        self.transform = transform

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        img_path, label = self.data[idx]
        #print(f'image paht = {img_path}')
        image = Image.open('/content/data/'+img_path)
        if self.transform:
            image = self.transform(image)
        return image, label

# Define a transform to convert the data into PyTorch tensors
transform = transforms.Compose([transforms.ToTensor()])

# Create the custom dataset
dataset = CustomDataset(data, transform=transform)

# Determine the lengths of your splits (70% train, 15% valid, 15% test)

total = len(dataset) # total length 

train_len = int(total * 0.7)
valid_len = int(total * 0.15)
test_len = total - train_len - valid_len

# Split the dataset
train_dataset, valid_dataset, test_dataset = random_split(dataset, [train_len, valid_len, test_len])

# Create data loaders for each split
train_loader = DataLoader(train_dataset, batch_size=128, shuffle=True)
valid_loader = DataLoader(valid_dataset, batch_size=128)
test_loader = DataLoader(test_dataset, batch_size=128)

# Function to visualize images
def visualize_data(loader, title):
    for images, labels in loader:
        # Now images and labels contain the data from the first batch
        break
    images = images.numpy()

    fig = plt.figure(figsize=(25, 4))

    for idx in np.arange(20):
        ax = fig.add_subplot(2, int(20/2), idx+1, xticks=[], yticks=[])  # Use int() to convert float to integer
        plt.imshow(images[idx].squeeze(), cmap='gray')  # Use cmap='gray' for grayscale images
        ax.set_title(str(labels[idx]))

    plt.suptitle(title)
    plt.show()

# Visualize the images and labels in each batch
visualize_data(train_loader, "Train Batch")
visualize_data(valid_loader, "Valid Batch")
visualize_data(test_loader, "Test Batch")













