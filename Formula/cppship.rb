class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "6a6daaee3f1a750d82dd18d1e89e1fedaecd34bb866e443869c2d304a9059ec0"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "f33ddd9a883065a1f110c540ece1c3203548ede68d44064237fa05b5eb4d9857"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ca3f257c1150abc1f4e5263f00fa0b1f5ac607706b3d6df5ce594100d8fb5d5b"
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
