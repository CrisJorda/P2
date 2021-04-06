import matplotlib.pyplot as plt
import soundfile as sf 
import numpy as np 

plt.figure(1)
senyalwav, fmwav = sf.read('pav_p2.wav')
twav = np.arange(0, len(senyalwav))/fmwav
plt.plot(twav, senyalwav)
plt.show()

plt.figure(2)
senyalwav2, fmwav2 = sf.read('pav_p2_s.wav')
twav2 = np.arange(0, len(senyalwav2))/fmwav2
plt.plot(twav2, senyalwav2)
plt.show()

plt.figure(3)
fig, axs = plt.subplots(2)
fig.suptitle('Original vs 0-substituted')
axs[0].plot(twav, senyalwav)
axs[0].set_title('Original .wav file')
axs[1].plot(twav2, senyalwav2)
axs[1].set_title('Modified .wav file')
plt.show()