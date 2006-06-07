require File.dirname(__FILE__) + '/../lib/spec'

context "Mocker" do

  specify "should be able to call mock()" do
    mock = mock("poke me")
    mock.should_receive(:poke)
    mock.poke
  end

  specify "should fail when expected message not received" do
    mock = mock("poke me")
    mock.should_receive(:poke)
  end
  
  specify "should fail when messages are received out of order" do
    mock = mock("one two three")
    mock.should_receive(:one).ordered
    mock.should_receive(:two).ordered
    mock.should_receive(:three).ordered
    mock.one
    mock.three
    mock.two
  end

end