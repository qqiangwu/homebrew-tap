class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "3e214b42259e87e61e9ba47d80aac512aed4b80da8bf11fed2a830dd1b4b6fe2"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "9e2299a782c4fc35412c0bf55c7252d9ac99f8aeaabcc64688eb322fcfdff353"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0de232e78b8505cb76f4755aea867093d6b841dcd1008f4303372ae9889ca442"
  end

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
