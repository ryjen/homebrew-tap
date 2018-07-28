
class LibCoda < Formula
  homepage 'https://github.com/ryjen/libcoda'

  desc 'a utility library'

  head 'https://github.com/ryjen/libcoda.git'

  version '0.5.1'

  depends_on 'cmake'
  depends_on 'json-c'
  depends_on 'mysql'
  depends_on 'sqlite3'
  depends_on 'postgresql'
  depends_on 'curl'
  depends_on 'uriparser'

  def install
    system "cmake", "." *std_cmake_args 
    system "make install"
  end

  test do 
    system "make", "test"
  end

end
