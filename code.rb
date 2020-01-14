# require 'rqrcode_core'
# qr = RQRCodeCore::QRCode.new('', size: 4, level: :h)
# puts qr.to_s

#
# require 'rqrcode_core'
#
# qr = RQRCodeCore::QRCode.new('--your link here--', size: 5, level: :h, mode: :kanji)
# qr.modules.each do |row|
#   row.each do |col|
#     print col ? '#' : ' '
#   end
#
#   print "\n"
# end

require 'rqrcode'
require 'launchy'

def yay

  qrcode = RQRCode::QRCode.new("--Your QR Link Here--")

  png = qrcode.as_png(
    bit_depth: 1,
    border_modules: 4,
    color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    color: 'black',
    file: nil,
    fill: 'white',
    module_px_size: 10,
    resize_exactly_to: false,
    resize_gte_to: false,
    size: 160
  )

  IO.write("/tmp/github-qrcode.png", png.to_s)

  Launchy.open("/tmp/github-qrcode.png")

end

yay
