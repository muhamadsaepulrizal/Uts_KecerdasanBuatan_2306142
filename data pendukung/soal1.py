def diagnosa_hama(daun_menguning, bercak_hitam, daun_berlubang, tanaman_layu):
    hasil = []
    
    if daun_menguning and tanaman_layu:
        hasil.append("Hama Wereng")
    if bercak_hitam and tanaman_layu:
        hasil.append("Infeksi Jamur Daun")
    if daun_berlubang and not daun_menguning:
        hasil.append("Serangan Ulat")
    if tanaman_layu and not daun_menguning and not bercak_hitam and not daun_berlubang:
        hasil.append("Penyakit Akar Membusuk")
    
    if not hasil:
        hasil.append("Tidak teridentifikasi hama")
    
    return hasil

def input_gejala(prompt):
    jawaban = input(prompt + " (y/n): ").strip().lower()
    return jawaban == 'y'

# Mulai input user
print("=== Sistem Diagnosa Hama Tanaman ===")
daun_menguning = input_gejala("Apakah daun menguning?")
bercak_hitam = input_gejala("Apakah terdapat bercak hitam?")
daun_berlubang = input_gejala("Apakah daun berlubang?")
tanaman_layu = input_gejala("Apakah tanaman layu?")

# Diagnosa
hasil_diagnosa = diagnosa_hama(daun_menguning, bercak_hitam, daun_berlubang, tanaman_layu)

print("\nHama yang Terdeteksi:")
for h in hasil_diagnosa:
    print("- ", h)
