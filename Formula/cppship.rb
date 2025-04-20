class Cppship < Formula
  desc "Cargo-like c++ build tool based on conan2 and cmake"
  homepage "https://github.com/qqiangwu/cppship"
  url "https://github.com/qqiangwu/cppship/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "1ce67b573c33bc78de212ff644f891694314dfd5e30db85856b9595d8f1221fb"
  license "BSL-1.0"
  head "https://github.com/qqiangwu/cppship.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/qqiangwu/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4eadf72c49e8c7b9d15e2c6c9745c4e99f9a6090a27c0575b20ab37a41d2350e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c8b113f7c52b7eeeb6f434761fbc138ba78170e797f6fe1db1f8c543bf7f47e1"
    sha256 cellar: :any_skip_relocation, ventura:       "b8dbb2a0bbdb7fc8edbe212f4a2486b5eb0c5c662fb3fece3673c8dcb9eb496f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fdecacc1e404d520d3d85bf5914684a8d2c4e2ca5cc0881fc653119906415bc6"
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
