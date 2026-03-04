import wave, struct, math, random, os

RATE = 44100
DURATION = 90
OUT = r"D:\development\workspace\SleepyTales App\assets\audio\music"

def write_wav(filename, samples):
    n = len(samples)
    fade = int(RATE * 6)
    for i in range(fade):
        t = i / fade
        samples[i] *= t
        samples[n - 1 - i] *= t
    peak = max(abs(s) for s in samples) or 1
    scale = 0.55 / peak
    packed = [max(-32767, min(32767, int(s * scale * 32767))) for s in samples]
    path = os.path.join(OUT, filename)
    with wave.open(path, "w") as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(RATE)
        f.writeframes(struct.pack(f"<{len(packed)}h", *packed))
    print(f"  ok {filename} ({os.path.getsize(path)//1024} KB)")

def wtone(freq, t, amp=1.0):
    s = math.sin(2*math.pi*freq*t)
    s += 0.28*math.sin(2*math.pi*freq*2*t)
    s += 0.08*math.sin(2*math.pi*freq*3*t)
    return s/1.36*amp

def adsr_env(i, n, a=0.05, d=0.15, sl=0.7, r=0.25):
    ai,di,ri = int(n*a),int(n*d),int(n*r)
    if i<ai: return i/ai
    if i<ai+di: return 1.0-(1.0-sl)*(i-ai)/di
    if i<n-ri: return sl
    if i<n: return sl*(1-(i-(n-ri))/ri)
    return 0.0

# 1. Piano lullaby - Brahms
def piano():
    C4,D4,E4,F4,G4,A4,G3 = 261.6,293.7,329.6,349.2,392.0,440.0,196.0
    B4,C5 = 493.9,523.3
    mel = [(G3,1.5),(C4,2),(E4,0.75),(G4,3),(E4,0.75),(G4,3),
           (G4,0.75),(C5,2),(C5,0.75),(B4,0.75),(A4,0.75),(G4,3),
           (G4,0.75),(A4,2),(A4,0.75),(C5,0.75),(B4,0.75),(A4,0.75),(G4,2.5),
           (E4,0.75),(F4,2),(F4,0.75),(A4,0.75),(G4,0.75),(F4,0.75),(E4,2.5),
           (C4,0.75),(D4,2),(D4,0.75),(F4,0.75),(E4,0.75),(D4,0.75),(C4,3.5)]
    beat = 0.62
    s = []
    for _ in range(6):
        for freq,beats in mel:
            n = int(RATE*beat*beats)
            a,d,r = int(n*0.04),int(n*0.18),int(n*0.35)
            for i in range(n):
                env = adsr_env(i,n,0.04,0.18,0.68,0.35)
                tr = 1.0+0.025*math.sin(2*math.pi*5.2*i/RATE)
                s.append(wtone(freq, i/RATE, env*tr*0.5))
            if len(s)>=RATE*DURATION: break
        if len(s)>=RATE*DURATION: break
    while len(s)<RATE*DURATION: s.append(0.0)
    write_wav("piano-lullaby.wav", s[:RATE*DURATION])

# 2. Music box - Twinkle
def musicbox():
    C5,D5,E5,F5,G5,A5 = 523.3,587.3,659.3,698.5,784.0,880.0
    mel = [(C5,1),(C5,1),(G5,1),(G5,1),(A5,1),(A5,1),(G5,2),
           (F5,1),(F5,1),(E5,1),(E5,1),(D5,1),(D5,1),(C5,2),
           (G5,1),(G5,1),(F5,1),(F5,1),(E5,1),(E5,1),(D5,2),
           (G5,1),(G5,1),(F5,1),(F5,1),(E5,1),(E5,1),(D5,2),
           (C5,1),(C5,1),(G5,1),(G5,1),(A5,1),(A5,1),(G5,2),
           (F5,1),(F5,1),(E5,1),(E5,1),(D5,1),(D5,1),(C5,3)]
    beat = 0.52
    s = []
    for _ in range(7):
        for freq,beats in mel:
            n = int(RATE*beat*beats)
            for i in range(n):
                dec = math.exp(-5.0*i/n)
                v = math.sin(2*math.pi*freq*i/RATE)*dec
                v += 0.12*math.sin(2*math.pi*freq*4*i/RATE)*math.exp(-9*i/n)
                s.append(v*0.38)
            if len(s)>=RATE*DURATION: break
        if len(s)>=RATE*DURATION: break
    while len(s)<RATE*DURATION: s.append(0.0)
    write_wav("music-box.wav", s[:RATE*DURATION])

# 3. Harp - pentatonic arpeggios
def harp():
    penta = [261.6,293.7,329.6,392.0,440.0,523.3,587.3,659.3,784.0]
    s = [0.0]*(RATE*DURATION)
    pats = [[0,1,2,3,4,3,2,1],[2,3,4,5,6,5,4],[0,2,4,5,3,1,0],[4,5,6,7,6,5,4]]
    ndur = 0.42
    tp, pi = 0, 0
    while tp < RATE*DURATION - RATE:
        for ni in pats[pi%len(pats)]:
            freq = penta[ni%len(penta)]
            n = int(RATE*ndur)
            for i in range(min(n, RATE*DURATION-tp-1)):
                env = math.exp(-2.8*i/n)
                s[tp+i] += wtone(freq, i/RATE, env*0.32)
            tp += int(RATE*ndur*0.68)
            if tp >= RATE*DURATION-RATE: break
        pi += 1
    write_wav("harp-melody.wav", s)

# 4. Wind chimes - soft pentatonic bells
def windchimes():
    freqs = [523.3,659.3,784.0,880.0,1046.5,1318.5]
    s = [0.0]*(RATE*DURATION)
    rng = random.Random(42)
    tp = int(RATE*1.5)
    while tp < RATE*(DURATION-8):
        freq = rng.choice(freqs)
        amp = rng.uniform(0.15,0.28)
        dur = rng.uniform(3.5,6.0)
        n = int(RATE*dur)
        for i in range(min(n, RATE*DURATION-tp-1)):
            env = (1-math.exp(-100*i/RATE))*math.exp(-1.0*i/n)
            v = math.sin(2*math.pi*freq*i/RATE)
            v += 0.18*math.sin(2*math.pi*freq*2.73*i/RATE)*math.exp(-2*i/n)
            s[tp+i] += v*env*amp
        tp += int(RATE*rng.uniform(2.0,5.0))
    write_wav("wind-chimes.wav", s)

# 5. Ocean - layered broadband noise with slow wave swells
def ocean():
    rng = random.Random(12)
    N = RATE * DURATION
    s = [0.0] * N

    # Layer 1: deep low-frequency rumble (filtered noise ~60-200 Hz range)
    # Simulate by summing many closely-spaced low sinusoids with random phase
    rumble_freqs = [f for f in range(55, 210, 4)]
    for freq in rumble_freqs:
        phase = rng.uniform(0, 2 * math.pi)
        amp = rng.uniform(0.003, 0.008)
        for i in range(N):
            s[i] += math.sin(2 * math.pi * freq * i / RATE + phase) * amp

    # Layer 2: mid surf hiss (300-900 Hz noise texture)
    surf_freqs = [f for f in range(300, 900, 18)]
    for freq in surf_freqs:
        phase = rng.uniform(0, 2 * math.pi)
        amp = rng.uniform(0.001, 0.004)
        for i in range(N):
            s[i] += math.sin(2 * math.pi * freq * i / RATE + phase) * amp

    # Layer 3: high airy hiss (1000-4000 Hz very quiet shimmer)
    hiss_freqs = [f for f in range(1000, 4000, 80)]
    for freq in hiss_freqs:
        phase = rng.uniform(0, 2 * math.pi)
        amp = rng.uniform(0.0003, 0.001)
        for i in range(N):
            s[i] += math.sin(2 * math.pi * freq * i / RATE + phase) * amp

    # Apply very slow wave swell envelope (one wave every 18-22 seconds)
    # Each wave builds gently and recedes — never goes near zero
    wave_period1 = 19.0
    wave_period2 = 23.5
    for i in range(N):
        t = i / RATE
        swell = (0.55
                 + 0.25 * math.sin(2 * math.pi * t / wave_period1)
                 + 0.15 * math.sin(2 * math.pi * t / wave_period2 + 1.1))
        s[i] *= swell

    write_wav("ocean-waves.wav", s)

# 6. Rain - gentle soft drops only
def rain():
    rng = random.Random(77)
    s = [0.0]*(RATE*DURATION)
    for i in range(RATE*DURATION):
        t = i/RATE
        base = 0.008*(rng.random()*2-1)
        swell = 0.45+0.45*math.sin(2*math.pi*t/14.0)
        s[i] = base*swell
    tp = 0
    while tp < RATE*DURATION:
        freq = rng.uniform(1000,2600)
        amp = rng.uniform(0.025,0.07)
        n = int(RATE*0.055)
        for i in range(min(n, RATE*DURATION-tp-1)):
            env = math.exp(-28*i/n)
            s[tp+i] += math.sin(2*math.pi*freq*i/RATE)*env*amp
        tp += int(RATE*rng.uniform(0.05,0.22))
    write_wav("rain-thunder.wav", s)

# 7. Forest birds - gentle whistles
def birds():
    rng = random.Random(13)
    s = [0.0]*(RATE*DURATION)
    for i in range(RATE*DURATION):
        t = i/RATE
        s[i] = 0.006*math.sin(2*math.pi*160*t)*(0.4+0.4*math.sin(2*math.pi*t/7))
    tp = int(RATE*1.2)
    while tp < RATE*(DURATION-3):
        sf = rng.uniform(2000,3000)
        ef = rng.uniform(2200,3400)
        amp = rng.uniform(0.05,0.12)
        dur = rng.uniform(0.18,0.55)
        n = int(RATE*dur)
        for i in range(min(n,RATE*DURATION-tp-1)):
            p = i/n
            freq = sf+(ef-sf)*p
            env = math.sin(math.pi*p)
            v = math.sin(2*math.pi*freq*i/RATE)
            v += 0.12*math.sin(2*math.pi*freq*1.5*i/RATE)
            s[tp+i] += v*env*amp*0.48
        tp += int(RATE*rng.uniform(2.0,6.0))
    write_wav("forest-birds.wav", s)

# 8. White noise -> soft warm chord pads
def chordpads():
    prog = [[261.6,329.6,392.0],[220.0,261.6,329.6],[174.6,220.0,261.6],[196.0,246.9,293.7]]
    cdur = 7.0
    s = []
    ci = 0
    while len(s)<RATE*DURATION:
        chord = prog[ci%len(prog)]
        ci += 1
        n = int(RATE*cdur)
        for i in range(n):
            t = i/RATE
            env = math.sin(math.pi*i/n)*0.22
            v = sum(math.sin(2*math.pi*f*t)*0.28+0.12*math.sin(2*math.pi*f*2*t) for f in chord)/len(chord)
            s.append(v*env)
    write_wav("white-noise.wav", s[:RATE*DURATION])

print("Generating 8 calm lullaby tracks...")
piano()
musicbox()
harp()
windchimes()
ocean()
rain()
birds()
chordpads()
print("All done!")
