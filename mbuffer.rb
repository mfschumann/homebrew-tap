# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mbuffer < Formula
  desc "mbuffer is a tool for buffering data streams  with a large set of unique features"
  homepage "https://www.maier-komor.de/mbuffer.html"
  url "https://www.maier-komor.de/software/mbuffer/mbuffer-20241007.tgz"
  sha256 "9d7363010b4ef45b1646f6b5f5027b49bb6a209c502fb84e281c7bd771d56bed"
  license "GPL-3.0-only"

  bottle do
    root_url "https://ghcr.io/v2/mfschumann/homebrew-tap"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6bcfd35b35505743d5fff53d6fa4178405326d4b318e393c672127c274866861"
  end

  depends_on "cmake" => :build

  def install
    system "./mkversion.sh"
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", "."
    system "cmake", "--install", ".", "--prefix=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mbuffer`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
