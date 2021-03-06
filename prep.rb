# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Prep < Formula
  desc "a c/c++ dependency manager and build tool"
  homepage "https://github.com/ryjen/prep"
  url "https://github.com/ryjen/prep/releases/download/v0.1.0/prep-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "ea81e0a1bacbbf822ee148aa11b75c63bcd5e309ef3c4b9047f7e3bc1fbecf11"
  depends_on "cmake" => :build

  head "https://github.com/ryjen/prep.git"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test prep`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "make", "test"
  end
end
