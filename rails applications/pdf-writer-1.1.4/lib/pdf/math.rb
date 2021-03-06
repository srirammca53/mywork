#--
# PDF::Writer for Ruby.
#   http://rubyforge.org/projects/ruby-pdf/
#   Copyright 2003 - 2005 Austin Ziegler.
#
#   Licensed under a MIT-style licence. See LICENCE in the main distribution
#   for full licensing information.
#
# $Id: math.rb 184 2007-12-10 03:18:48Z sandal $
#++
  # Encapsulate some of the mathematical calculations that need to be
  # performed when working with PDF documents. All angles in PDF::Writer are
  # measured in degrees, but all angles in PDF documents are in radians. The
  # standard conversions between radians, degrees, and gradians are
  # provided.
  #
  # As with the Perl implementations of these conversions, they will be
  # wrapped in the range of the target measurement (0..PI2 for radians,
  # 0..360 for degrees, and 0..400 for gradians). To prevent this wrapping,
  # provide a false value for the +wrap+ parameter.
  #
  # To wrap these values manually, use #rad2rad, #deg2deg, or #grad2grad.
module PDF::Math
  class << self
    PI2   = ::Math::PI * 2.0

      # One degree of arc measured in terms of radians.
    DR  = PI2 / 360.0
      # One radian of arc, measured in terms of degrees.
    RD  = 360 / PI2
      # One degree of arc, measured in terms of gradians.
    DG  = 400 / 360.0
      # One gradian of arc, measured in terms of degrees.
    GD  = 360 / 400.0
      # One radian of arc, measured in terms of gradians.
    RG  = 400 / PI2
      # One gradian of arc, measured in terms of radians.
    GR  = PI2 / 400.0

      # Truncate the remainder.
    def remt(num, den)
      num - den * (num / den.to_f).to_i
    end

      # Wrap radian values within the range of radians (0..PI2).
    def rad2rad(rad)
      remt(rad, PI2)
    end

      # Wrap degree values within the range of degrees (0..360).
    def deg2deg(deg)
      remt(deg, 360)
    end

      # Wrap gradian values within the range of gradians (0..400).
    def grad2grad(grad)
      remt(grad, 400)
    end

      # Convert degrees to radians. The value will be constrained to the
      # range of radians (0..PI2) unless +wrap+ is false.
    def deg2rad(deg, wrap = true)
      rad = DR * deg
      rad = rad2rad(rad) if wrap
      rad
    end

      # Convert degrees to gradians. The value will be constrained to the
      # range of gradians (0..400) unless +wrap+ is false.
    def deg2grad(deg, wrap = true)
      grad = DG * deg
      grad = grad2grad(grad) if wrap
      grad
    end

      # Convert radians to degrees. The value will be constrained to the
      # range of degrees (0..360) unless +wrap+ is false.
    def rad2deg(rad, wrap = true)
      deg = RD * rad
      deg = deg2deg(deg) if wrap
      deg
    end

      # Convert radians to gradians. The value will be constrained to the
      # range of gradians (0..400) unless +wrap+ is false.
    def rad2grad(rad, wrap = true)
      grad = RG * rad
      grad = grad2grad(grad) if wrap
      grad
    end

      # Convert gradians to degrees. The value will be constrained to the
      # range of degrees (0..360) unless +wrap+ is false.
    def grad2deg(grad, wrap = true)
      deg = GD * grad
      deg = deg2deg(deg) if wrap
      deg
    end

      # Convert gradians to radians. The value will be constrained to the
      # range of radians (0..PI2) unless +wrap+ is false.
    def grad2rad(grad, wrap = true)
      rad = GR * grad
      rad = rad2rad(rad) if wrap
      rad
    end
  end
end
