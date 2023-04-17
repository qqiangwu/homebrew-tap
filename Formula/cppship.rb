class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.0.1-beta.tar.gz"
  version "0.0.1"
  sha256 "abbb0c2d31dbee83ce2dcc1bc4cf612cd881b78d44f781f59818ccccfa641be8"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  depends_on "cmake"
  depends_on "conan"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"cppship"
    system bin/"cppship", "init", "--std=20", "demo"
  end
end
