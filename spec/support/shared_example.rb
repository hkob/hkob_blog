# @see https://hkob.hatenablog.com/entry/2023/12/20/050000
shared_examples_for "レスポンスコード確認" do |value|
  it "レスポンスのステータスが #{value} であること" do
    subject.call
    expect(response.status).to eq value
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/21/050000
shared_examples_for "描画結果に文字列が含まれている?" do |strs|
  it "レスポンスの文字列が「#{strs}」を含むこと" do
    subject.call
    Array(strs).each { |str| expect(response.body).to include str }
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/21/050000
shared_examples_for "描画結果に文字列が含まれていない?" do |strs|
  it "レスポンスの文字列が「#{strs}」を含まないこと" do
    subject.call
    Array(strs).each { |str| expect(response.body).not_to include str }
  end
end