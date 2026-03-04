import numpy as np, wave, os

RATE = 44100
DURATION = 90
OUT = r'D:\development\workspace\SleepyTales App\assets\audio\music'
rng = np.random.default_rng(7)
n = RATE * DURATION

def save_wav(name, sig):
    fade = int(RATE * 4)
    sig[:fade] *= np.linspace(0, 1, fade)
    sig[-fade:] *= np.linspace(1, 0, fade)
    sig = sig / (np.max(np.abs(sig)) + 1e-9) * 0.65
    packed = np.clip(sig * 32767, -32767, 32767).astype(np.int16)
    path = os.path.join(OUT, name)
    with wave.open(path, 'w') as f:
        f.setnchannels(1); f.setsampwidth(2); f.setframerate(RATE)
        f.writeframes(packed.tobytes())
    print(f'{name}: {os.path.getsize(path)//1024} KB -- OK')

# ── FIX 1: FLUTE - removed reverb delay (was causing blur) ──────────────────
# Clean pure flute tone, breath only at attack, no overlap between notes
notes = [
    (0.0,  0.9, 392.0), (0.9,  0.9, 392.0), (1.8,  0.5, 392.0),
    (2.3,  1.3, 523.3), (3.6,  0.9, 587.3), (4.5,  0.9, 523.3),
    (5.4,  0.9, 440.0), (6.3,  1.8, 392.0),
    (8.1,  0.9, 440.0), (9.0,  0.9, 523.3), (9.9,  0.9, 587.3),
    (10.8, 2.5, 659.3),
    (13.3, 0.9, 587.3), (14.2, 0.9, 523.3), (15.1, 1.8, 440.0),
    (16.9, 0.9, 349.2), (17.8, 0.9, 392.0), (18.7, 2.5, 523.3),
]
phrase_len = 21.2
flute = np.zeros(n)
for start, dur, freq in notes:
    for rep in range(int(DURATION / phrase_len) + 2):
        t0 = start + rep * phrase_len
        if t0 >= DURATION: break
        t1 = min(t0 + dur * 0.88, DURATION)
        i0, i1 = int(t0 * RATE), int(t1 * RATE)
        if i1 <= i0: continue
        seg = i1 - i0
        st = np.arange(seg) / RATE
        # Pure flute: fundamental + very quiet 2nd harmonic
        tone = np.sin(2*np.pi*freq*st) * 0.72 + np.sin(2*np.pi*freq*2*st) * 0.14
        # Breath only RIGHT at attack - not throughout the note (was causing blur)
        breath = rng.standard_normal(seg) * 0.020 * np.exp(-st * 15)
        env = np.ones(seg)
        atk = min(int(0.08*RATE), seg)
        rel = min(int(0.18*RATE), seg)
        env[:atk] = np.linspace(0, 1, atk)
        env[-rel:] = np.linspace(1, 0, rel)
        flute[i0:i1] += (tone + breath) * env * 0.42

# NO reverb/delay line - that was the blur cause
save_wav('flute-lullaby.wav', flute)

# ── FIX 2: DREAMY CHORDS - fixed sequential timing (pos was never moving!) ──
# Bug was: all 4 chords started at same t0, leaving 24sec silence between bursts
chord_seq = [
    ([261.6, 329.6, 392.0], 5.5),  # C maj
    ([220.0, 261.6, 329.6], 5.5),  # A min
    ([174.6, 220.0, 261.6], 5.5),  # F maj
    ([196.0, 246.9, 293.7], 5.5),  # G maj
]
gap = 0.7  # gentle 0.7s silence between each chord - natural breathing room

pad = np.zeros(n)
pos = 0.0
while pos < DURATION:
    for freqs, dur in chord_seq:
        t0 = pos
        t1 = min(t0 + dur, DURATION)
        i0, i1 = int(t0 * RATE), int(t1 * RATE)
        seg = i1 - i0
        if seg <= 0:
            pos += dur + gap
            continue
        st = np.arange(seg) / RATE
        chord_sig = np.zeros(seg)
        for freq in freqs:
            chord_sig += np.sin(2*np.pi*freq*st) * 0.26
            chord_sig += np.sin(2*np.pi*freq*2*st) * 0.07
            chord_sig += np.sin(2*np.pi*freq*0.5*st) * 0.05
        # Slow pad: 1.8s fade in, 1.8s fade out - smooth and warm
        env = np.ones(seg)
        atk = min(int(1.8*RATE), seg//2)
        rel = min(int(1.8*RATE), seg//2)
        env[:atk] = np.linspace(0, 1, atk)
        env[-rel:] = np.linspace(1, 0, rel)
        tremolo = 1.0 + 0.03 * np.sin(2*np.pi*0.12*st)
        pad[i0:i1] += chord_sig * env * tremolo * 0.34
        pos += dur + gap  # FIX: actually advance position to next chord
        if pos >= DURATION: break

save_wav('dreamy-chords.wav', pad)
print('Both fixed!')
