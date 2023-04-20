class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "9048ce291db6e092fe9757404fc02dcba3866bd02bc97156c571839680edf9fa"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "dd54e9f86fdf9f68781ce6cf1d919522b9ddce638f877ae7577f51101ee7d227"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1e89f046292cb7bbd2b0a9be3700cf09c74e790e6e496729e7c7b816a09cbd4b"
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
