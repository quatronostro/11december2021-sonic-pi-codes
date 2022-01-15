#Edited by Berke Baramuk

#buffer 4-------------------------------------



1.times do
  sample "C:/Users/Berke/Desktop/train-station-voice-russian-dirty_E_minor.wav"
  sleep 100
end



#buffer 5-------------------------------------

use_sched_ahead_time 1

live_loop :ambi1 do
  stop
  p = line(-0.85, 0.85, steps: 2).mirror.tick
  sample "C:/Users/Berke/Desktop/cyberpunk-cellar_93bpm.wav", pan: p, amp: rrand(0.6, 0.8)
  sleep 7.68
end

live_loop :ambi2 do
  stop
  with_fx :lpf, pre_mix: 0.5 do
    with_fx :reverb, mix: 0.8 do
      sample "C:/Users/Berke/Desktop/deathly-hallows-pad-melody-detuned_110bpm_E_minor.wav", amp: 1
      sleep 17.45
    end
  end
end

#buffer 2--------------------------------------

use_debug false
use_sched_ahead_time 1
use_bpm 115
set(:bpm, current_bpm)


live_loop :metro do
  use_bpm get(:bpm)
  sleep 1
end

set_mixer_control! lpf_slide: 30, lpf: 120
set_mixer_control! hpf_slide: 30, hpf: 10

live_loop :noi, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :noise
  with_fx :echo, mix: 0.5 do
    with_fx :reverb, mix: 0.6 do
      s = play 80, atack: 1, decay: 1, sustain: 35, release: 15,
        note_slide: 15, amp: 0.6,
        cutoff: 10, cutoff_slide: 20,
        hpf: 100, hpf_slide: 10
      sleep 10
      control s, note: 120, cutoff: 120, hpf: 10
      sleep 30
      control s, note: 80, cutoff: 10, hpf: 100
      sleep 100
    end
  end
end

live_loop :kick, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.4 do
    with_fx :distortion, mix: 0.3 do
      sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/clubkick/2.flac", amp: 2, cutoff: 70, release: 0.5
      sleep 1
    end
  end
end

live_loop :snare, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.7 do
    sample "C:/Users/Berke/Desktop/frens-snare_A_minor.wav", amp: 2.1, cutoff: 90, release: 0.5, pan: 0.5
    sample "C:/Users/Berke/Desktop/frens-snare_A_minor.wav", amp: 2.2, cutoff: 90, release: 0.5, pan: -0.5
    sleep 2
  end
end

live_loop :synth_bass02, sync: :metro do
  stop
  use_bpm get(:bpm)
  a1 = (ring 0, 0.4, 0.9, 0.9)
  a2 = 0.6
  c = line(5, 90, steps: 300).mirror.look
  r = 0.3
  tick
  use_synth :fm
  with_fx :flanger, invert_flange: 0 do
    with_fx :rhpf, mix: 0.2 do
      play :e2, cutoff: 80, amp: a1.look, release: r
      play :e3, cutoff: 80, amp: a1.look, release: r
      sleep 0.25
    end
  end
end

live_loop :melo, sync: :metro do
  stop
  use_bpm get(:bpm)
  a = line(0.1, 0.9, steps: 300).mirror.look
  use_synth :rodeo
  notes1 = (ring :g3, :e3, :gb3, :e3, :g3, :b3, :gb3, :e3)
  tick
  with_fx :reverb, mix: 0.7 do
    with_fx :krush, mix: 0.6 do
      play notes1.look, amp: a, attack: 0.1, release: 0.4, sustain: 0.5, cutoff: 50
      sleep 1
    end
  end
end

live_loop :arpej, sync: :metro do
  stop
  use_bpm get(:bpm)
  c = line(40, 80, steps: 124).mirror.look
  r = line(0.2, 0.5, steps: 100).mirror.look
  f = line(0.3, 0.8, steps: 50).mirror.look
  use_synth :prophet
  notes = (ring :e3, :g3, :b3, :c4, :b3, :g3,
           :e3, :g3, :b3, :c4, :b3, :g3,
           :e3, :g3, :b3, :c4)
  tick
  with_fx :krush, mix: f do
    play notes.look, attack: 0, release: r, cutoff: c, amp: 0.8
    sleep 0.25
  end
end

live_loop :cho, sync: :metro do
  stop
  use_bpm get(:bpm)
  a = line(0.1, 0.7, steps: 3).tick
  a2 = 0.6
  tick
  use_synth :supersaw
  with_fx :rlpf, mix: 0.7 do
    with_fx :reverb, mix: 0.9, room: 0.8 do
      1.times do
        2.times do
          play chord(:e5, '5'), sustain: 12, release: 2, amp: a2, cutoff: 90
          sleep 12
        end
        2.times do
          play chord(:e5, :m), sustain: 12, release: 2, amp: a2, cutoff: 90
          sleep 12
        end
        1.times do
          play chord(:g5, '5'), sustain: 12, release: 2, amp: a2, cutoff: 90
          sleep 12
        end
        1.times do
          play chord(:d5, :madd2), sustain: 12, release: 2, amp: a2, cutoff: 90
          sleep 12
        end
        1.times do
          play chord(:a4, :m6), sustain: 12, release: 2, amp: a2, cutoff: 90
          sleep 12
        end
      end
    end
  end
end

live_loop :synth_bass01, sync: :metro do
  stop
  use_bpm get(:bpm)
  a2 = 0.7
  c2 = 85
  r = 0.4
  tick
  use_synth :fm
  with_fx :reverb, mix: 0.5 do
    with_fx :distortion, mix: 0.4 do
      with_fx :krush, mix: 0.5 do
        1.times do
          64.times do
            sleep 0.25
            play :e2, cutoff: c2, amp: a2, release: r
            play :e3, cutoff: c2, amp: a2, release: r
            sleep 0.5
          end
          16.times do
            sleep 0.25
            play :g2, cutoff: c2, amp: a2, release: r
            play :g3, cutoff: c2, amp: a2, release: r
            sleep 0.5
          end
          16.times do
            sleep 0.25
            play :d2, cutoff: c2, amp: a2, release: r
            play :d3, cutoff: c2, amp: a2, release: r
            sleep 0.5
          end
          16.times do
            sleep 0.25
            play :a2, cutoff: c2, amp: a2, release: r
            play :a3, cutoff: c2, amp: a2, release: r
            sleep 0.5
          end
        end
      end
    end
  end
end


#buffer 1--------------------------------------------

use_debug false
use_sched_ahead_time 1
use_bpm 115
set(:bpm, current_bpm)


live_loop :metro do
  use_bpm get(:bpm)
  sleep 1
end

set_mixer_control! lpf_slide: 10, lpf: 120
set_mixer_control! hpf_slide: 10, hpf: 10

live_loop :snare2, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :echo, mix: 0.9 do
    with_fx :reverb, mix: 0.7 do
      sample "C:/Users/Berke/Desktop/frens-snare_A_minor.wav", amp: 2, cutoff: 100, release: 0.5, pan: 0.5
      sleep 0.25
      sample "C:/Users/Berke/Desktop/frens-snare_A_minor.wav", amp: 1, cutoff: 80, release: 0.5, pan: -0.5
      sleep 0.25
      sample "C:/Users/Berke/Desktop/frens-snare_A_minor.wav", amp: 2, cutoff: 60, release: 0.5, pan: 0
      sleep 12
    end
  end
end

live_loop :noih, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :noise
  with_fx :reverb, mix: 0.6 do
    sleep 1
    play :e5, amp: 0.4, release: 0.5
    sleep 1
  end
end

hihats = "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808oh"

live_loop :hihat2, sync: :metro do
  stop
  use_bpm get(:bpm)
  sample hihats, 5, amp: 1, cutoff: 100, release: 0.3
  sleep 0.25
end

live_loop :hihat3, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.5 do
    sleep 0.5
    sample hihats, 1, amp: 1, cutoff: 95, pan: 0.8
    sample hihats, 1, amp: 1, cutoff: 95, pan: -0.8
    sleep 0.5
  end
end

live_loop :mi, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :dark_ambience
  p = line(0.7, -0.7, steps: 10).mirror.look
  with_fx :reverb, mix: 1, room: 0.6 do
    1.times do
      play chord(:e3, :madd2), attack: 1, sustain: 3, release: 2, amp: 1.8, cutoff: 90, pan: p
      sleep 4
      play chord(:e2, :madd2), attack: 1, sustain: 3, release: 2, amp: 1.5, cutoff: 90, pan: p
      sleep 4
    end
  end
end




#buffer 0---------------------------------------------------------

use_debug false
use_sched_ahead_time 1
use_bpm 139
set(:bpm, current_bpm)

live_loop :metro do
  use_bpm get(:bpm)
  sleep 1
end

set_mixer_control! lpf_slide: 30, lpf: 120
set_mixer_control! hpf_slide: 10, hpf: 10

live_loop :kick, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :distortion, mix: 0.3 do
    with_fx :reverb, mix: 0.3 do
      sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/electro1/006_et1kick2.flac", amp: 1.6, cutoff: 90, release: 0.2
      sleep 1
    end
  end
end

##| 1.times do
##|   use_synth :dpulse
##|   s = play 28, sustain: 25, release: 10, note_slide: 10, amp: 0.6, cutoff: 40, cutoff_slide: 10
##|   sleep 5
##|   control s, note: 64, cutoff: 100
##|   sleep 10
##|   control s, note: 28, cutoff: 60
##|   sleep 10
##| end

live_loop :bass01, sync: :metro do
  stop
  use_bpm get(:bpm)
  v1 = line(0.1, 0.5, steps: 50).mirror.look
  p = (ring 0.8, -0.8).look
  c = line(70, 100, steps: 150).mirror.look
  c2 = line(70, 05, steps: 250).mirror.look
  r = 0.4
  tick
  use_synth :dpulse
  with_fx :flanger, mix: v1 do
    with_fx :reverb, mix: 0.7 do
      sleep 0.25
      play :e1, cutoff: c2, amp: 0.3, release: r, pan: p
      play :e2, cutoff: c2, amp: 0.3, release: r, pan: p
      sleep 0.5
    end
  end
end

live_loop :bass2, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :fm
  notes2 = (ring :e2, :e3, :b2, :g2, :g2)
  s2 = (ring 0.25, 1.25, 0.5, 0.25, 1.75)
  tick
  with_fx :distortion, mix: 0.2 do
    play notes2.look, amp: 0.9, cutoff: 100, attack: 0, release: 0.25
    sleep s2.look
  end
end

live_loop :hho, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.4 do
    15.times do
      sleep 0.5
      sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808/MA.flac", amp: 0.7, cutoff: 120, release: rrand(0.1, 0.4)
      sleep 0.5
    end
    2.times do
      sleep 0.25
      sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808/MA.flac", amp: 0.7, cutoff: 120, release: 0.2
      sleep 0.25
    end
  end
end

live_loop :clp, sync: :metro do
  stop
  use_bpm get(:bpm)
  sleep 1
  with_fx :reverb, mix: 0.4 do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808/CP.flac", amp: 0.8, release: 0.5, cutoff: 95
    sleep 1
  end
end

live_loop :nois, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  1.times do
    use_synth :noise
    with_fx :hpf, mix: 0.7 do
      play :e5, amp: 0.5, release: 0.6
      sleep 32
    end
  end
end

live_loop :bass3, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  with_fx :reverb, mix: 0.5 do
    1.times do
      with_fx :compressor, mix: 1 do
        use_synth :tech_saws
        s = play 40, sustain: 20, release: 10, note_slide: 1, amp: 0.6, cutoff: 40, cutoff_slide: 10
        sleep 5
        control s, note: 47, cutoff: 60
        sleep 10
        control s, note: 45
        sleep 20
      end
    end
  end
end

live_loop :hhh, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :hpf, mix: 0.8 do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808/CH.flac", amp: 0.6, release: 0.1, cutoff: 120
    sleep 0.25
  end
end

live_loop :bass4, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :fm
  tick
  with_fx :distortion, mix: 0.2 do
    1.times do
      play :e3, amp: 0.7, attack: 0.1, sustain: 15, release: 0.4, cutoff: 50
      sleep 16
    end
    1.times do
      play :g3, amp: 0.6, attack: 0.1, sustain: 7, release: 0.4, cutoff: 40
      sleep 8
    end
    1.times do
      play :d3, amp: 0.7, attack: 0.1, sustain: 7, release: 0.4, cutoff: 50
      sleep 8
    end
  end
end

live_loop :arpej2, sync: :metro do
  stop
  use_bpm get(:bpm)
  c = line(40, 100, steps: 264).mirror.look
  re = line(0.3, 0.8, steps: 50).mirror.look
  use_synth :supersaw
  s = (ring 0.25, 0.25, 0.25, 1)
  notes = (ring :e3, :g3, :a3, :b4,)
  tick
  with_fx :reverb, mix: re do
    play notes.look, attack: 0.01, release: 0.2, cutoff: c, amp: 0.5
    sleep s.look
  end
end

live_loop :solo, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :kalimba
  tick
  play chord(:e4, '7sus2').choose, amp: 1.3
  sleep rrand(0.25, 1)
end




#buffer 8-------------------------------------------

use_debug false
use_bpm 139
set(:bpm, current_bpm)


live_loop :metro do
  use_bpm get(:bpm)
  sleep 1
end

set_mixer_control! lpf_slide: 1, lpf: 120
set_mixer_control! hpf_slide: 1, hpf: 12

live_loop :basrepeat, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  use_synth :saw
  cc = line(70, 120, steps: 100).mirror.look
  notas = (ring :db2, :d2, :db2, :e2, :db2, :f2, :db2, :d2)
  with_fx :reverb, mix: 0.2 do
    with_fx :krush, mix: 0.3 do
      play notas.look, release: 0.4, amp: 1.6, cutoff: cc, attack: 0
      sleep 0.5
    end
  end
end

live_loop :noi, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.7 do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/seawolf/002_torpedo.flac", amp: 2, release: 3
    sleep 100
  end
end

live_loop :kik2, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.3 do
    sample :bd_mehackit, amp: 0.4, cutoff: 110
    sample :bd_haus, amp: 2, cutoff: 100
    sleep 1
  end
end

live_loop :melod, sync: :metro do
  ##| stop
  use_bpm get(:bpm)
  use_synth :dark_ambience
  with_fx :krush, mix: 0.1 do
    with_fx :gverb do
      play :db5, sustain: 20, amp: 0.1, cutoff: 90, pan: -1
      play :db5, sustain: 20, amp: 0.1, cutoff: 90, pan: 1
      sleep 20
    end
  end
end

live_loop :bass3, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  with_fx :reverb, mix: 0.4 do
    1.times do
      use_synth :tech_saws
      s = play 64, sustain: 55, release: 3, note_slide: 1, amp: 0.6, cutoff: 30, cutoff_slide: 10
      sleep 3
      control s, cutoff: 50
      sleep 13
      control s, cutoff: 70
      sleep 16
      control s, note: 65, cutoff: 90
      sleep 11
      control s, note: 61, cutoff: 70
      sleep 7
      control s, cutoff: 40
      sleep 4
      control s, cutoff: 20
      sleep 5
    end
  end
end

live_loop :hit4, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  p = line(-0.5, 0.5, steps: 180).mirror.look
  sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/ifdrums/ignorehh.flac", amp: 0.9, pan: p
  sleep 0.25
end

live_loop :cl, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  s = (ring 6.75, 0.5, 4.25, 4.5, 6.75, 0.5, 4.25, 4.5)
  with_fx :reverb, mix: 0.5 do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/808/CP.flac", amp: 1.8, cutoff: 110
    sleep s.look
  end
end

live_loop :cy, sync: :metro do
  stop
  use_bpm get(:bpm)
  sleep 0.5
  with_fx :reverb, mix: 0.5 do
    sample :drum_cymbal_closed, amp: 1.5, cutoff: 124, pan: 0.25
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/ifdrums/ignorehh.flac", release: 0.3, amp: 1, pan: -0.25
    sleep 0.5
  end
end

live_loop :bas2, sync: :metro do
  stop
  use_bpm get(:bpm)
  use_synth :dsaw
  tick
  notas = (ring :db3, :db2, :db3, :db2,
           :d3, :db2, :db3, :db2,
           :db3, :db2, :db3, :db2,
           :e3, :db2, :db3, :db2,
           :db3, :db2, :db3, :db2,
           :f3, :db2, :db3, :db2,
           :db3, :db2, :db3, :db2,
           :d3, :db2, :db3, :db2,)
  aa = (ring 1.5, 1, 1.5, 1)
  cc = line(90, 120, steps: 300).mirror.look
  i = line(0.1, 0.8, steps: 80).mirror.look
  k = line(0.5, 0.1, steps: 100).mirror.look
  ##| with_fx :ixi_techno, mix: i do
  with_fx :krush, mix: k do
    play notas.look, release: 0.2, amp: 1.7, cutoff: cc
    sleep 0.25
  end
  ##| end
end


live_loop :bas4, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  use_synth :saw
  cc = line(70, 120, steps: 100).mirror.look
  notas = (ring :db2, :d2, :db2, :e2, :db2, :f2, :db2, :d2)
  with_fx :reverb, mix: 0.2 do
    with_fx :krush, mix: 0.3 do
      1.times do
        play notas.look, release: 0.4, amp: 1.5, cutoff: 70
        sleep 0.5
      end
    end
  end
end

live_loop :vois, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :echo, mix: 0.6 do
    sample "C:/Users/Berke/Desktop/189467__speedenza__poem-darkness-voice.wav", rate: 0.9, amp: 1.5,
      release: 1, cutoff: 110
    sleep 100
  end
end





#buffer 9------------------------------------
use_debug false
use_bpm 139
set(:bpm, current_bpm)


live_loop :metro do
  use_bpm get(:bpm)
  sleep 1
end


set_mixer_control! lpf_slide: 1, lpf: 120
set_mixer_control! hpf_slide: 1, hpf: 12


live_loop :noi2, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.7 do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/seawolf/002_torpedo.flac", amp: 2, release: 3
    sleep 100
  end
end

live_loop :kik, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :reverb, mix: 0.3 do
    sample :bd_mehackit, amp: 0.4, cutoff: 110
    sample :bd_haus, amp: 2, cutoff: 100
    sleep 1
  end
end

live_loop :hhhh, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  p = line(1, -1, steps: 70).mirror.look
  sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/sid/008_hihat02.flac", amp: 2, pan: p
  sleep 0.25
end

live_loop :snare, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  sleep 1
  with_fx :reverb do
    sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/sid/010_sidsnares.flac", amp: 2
    sleep 1
  end
end

live_loop :cy, sync: :metro do
  stop
  use_bpm get(:bpm)
  sleep 0.5
  with_fx :reverb, mix: 0.5 do
    sample :drum_cymbal_closed, amp: 1.2, cutoff: 124, pan: 0.25
    sleep 0.5
  end
end

live_loop :perc1, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  ss = (ring 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.75, 0.5, 0.25)
  sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/ifdrums/ignorehh.flac", release: 0.3, amp: 0.8
  sleep ss.look
end

live_loop :ride, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  sample "C:/Users/Berke/Desktop/~/petal/Dirt-Samples/odx/004_DXRide.flac", amp: 1.4, cutoff: 110
  sleep 1
end

live_loop :basskey, sync: :metro do
  stop
  use_bpm get(:bpm)
  c1 = line(100, 120, steps: 100).mirror.look
  ii = line(0.1, 1, steps: 10).mirror.look
  with_fx :ixi_techno, mix: ii do
    sample "C:/Users/Berke/Desktop/fin/squarebass.wav", amp: 3, cutoff: 120, pitch: 0.95
    sleep 4
  end
end

live_loop :fx, sync: :metro do
  stop
  use_bpm get(:bpm)
  with_fx :echo do
    sample "C:/Users/Berke/Desktop/fin/fx.wav", amp: 0.9, pitch: 0.6
    sleep rrand(6, 16)
  end
end

live_loop :lead, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  cc = line(70, 110, steps: 10).mirror.look
  sample "C:/Users/Berke/Desktop/Yeni klasör/48488__flick3r__phat.wav", amp: 1.5, rate: 1.33,
    cutoff: cc
  sleep 16
end

live_loop :newbeat, sync: :metro do
  stop
  use_bpm get(:bpm)
  tick
  sample "C:/Users/Berke/Desktop/Yeni klasör/107053__mikobuntu__3.wav", rate: 0.99
  sleep 12
end

live_loop :fa, sync: :metro do
  stop
  use_bpm get(:bpm)
  c = line(50, 100, steps: 8).tick
  use_synth :tech_saws
  with_fx :reverb do
    play :f2, sustain: 4, amp: 0.8, release: 1, cutoff: c, attack: 0
    sleep 8
  end
end






