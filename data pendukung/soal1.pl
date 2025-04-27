% Fakta dan Aturan Diagnosa Hama

diagnosa(Hama) :-
    daun_menguning,
    tanaman_layu,
    Hama = 'Hama Wereng'.

diagnosa(Hama) :-
    bercak_hitam,
    tanaman_layu,
    Hama = 'Infeksi Jamur Daun'.

diagnosa(Hama) :-
    daun_berlubang,
    \+ daun_menguning,
    Hama = 'Serangan Ulat'.

diagnosa(Hama) :-
    tanaman_layu,
    \+ daun_menguning,
    \+ bercak_hitam,
    \+ daun_berlubang,
    Hama = 'Penyakit Akar Membusuk'.

diagnosa('Tidak teridentifikasi hama') :-
    \+ (daun_menguning; bercak_hitam; daun_berlubang; tanaman_layu).

% Untuk input manual
tanya(Gejala) :-
    format('Apakah ~w? (y/n): ', [Gejala]),
    read(Jawaban),
    (Jawaban == y -> assertz(Gejala) ; true).

% Program utama
start :-
    retractall(daun_menguning),
    retractall(bercak_hitam),
    retractall(daun_berlubang),
    retractall(tanaman_layu),
    nl,
    write('=== Sistem Diagnosa Hama Tanaman ==='), nl,
    tanya(daun_menguning),
    tanya(bercak_hitam),
    tanya(daun_berlubang),
    tanya(tanaman_layu),
    nl,
    write('Hama yang Terdeteksi:'), nl,
    findall(H, diagnosa(H), Hasil),
    list_hasil(Hasil).

list_hasil([]) :- !.
list_hasil([H|T]) :-
    format('- ~w~n', [H]),
    list_hasil(T).
