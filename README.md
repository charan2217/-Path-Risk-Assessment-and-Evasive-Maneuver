# -Path-Risk-Assessment-and-Evasive-Maneuver
# 🚘 AI-Powered Risk Prediction for Autonomous Vehicles using MATLAB

> A beginner-friendly but powerful simulation of an autonomous vehicle’s obstacle detection, lane-keeping, and AI-based predictive safety using LSTM in MATLAB.

---

### 🎯 Project Goals

- Simulate ego vehicle on a road with obstacles
- Detect nearby objects using virtual LiDAR
- Maintain lane and auto-correct drifts
- Use LSTM to **predict driving risk in real-time**
- Display risk status as simulation runs

---

### 🧠 Key Features

| Feature              | Description                                  |
|---------------------|----------------------------------------------|
| 🚗 Vehicle Control   | Adjusts speed based on obstacle distance     |
| 📏 LiDAR Logic       | Virtual distance checking with range limits  |
| 🛣️ Lane Keeping      | Drifts simulated + auto-correction steering  |
| 🔮 LSTM AI Prediction | Predicts risk from past speed/obstacle data |

---

### 📽️ Demo

![Simulation GIF](snapshots/simulation.gif)

> See `/demo_video.mp4` or view on [YouTube link if uploaded]

---

### 🧑‍💻 Files

| File                      | Purpose                             |
|---------------------------|-------------------------------------|
| `ai_risk_simulation.m`    | Main simulation script              |
| `train_lstm_model.m`      | Code to train LSTM neural net       |
| `risk_data.mat`           | Saved training data (auto-created)  |
| `risk_predictor_lstm.mat` | Trained model (after training)      |

---

### 📊 Sample Output

<img src="Screenshot (569).png" width="400"/>
<img src="Screenshot (571).png" width="400"/>
<img src="Screenshot (570).png" width="400"/>

---

### 💡 How to Use

1. Run `ai_risk_simulation.m` to simulate vehicle and generate data
2. Run `train_lstm_model.m` to train the LSTM predictor
3. Rerun the simulation to see live risk predictions
4. Modify obstacle positions, drift logic, or use real-world driving data!

---

### ⚙️ Dependencies

- MATLAB R2023a or later
- Deep Learning Toolbox
- (No Automated Driving Toolbox required!)

---

### 📫 Credits

Developed by [Parava Charan reddy]  
Inspired by real-world ADAS risk detection systems.

