### model spec

# @see https://hkob.hatenablog.com/entry/2023/12/05/050000
shared_examples_for "存在制約" do |keys|
  it { is_expected.to be_valid }

  keys&.each do |key|
    it "#{key} の内容が nil のとき、エラーになること" do
      subject[key] = nil
      expect(subject).not_to be_valid
    end
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/05/050000
shared_examples_for "削除可能制約" do
  it "削除できること" do
    klass = subject.class
    expect { subject.destroy }.to change(klass, :count).by(-1)
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/05/050000
shared_examples_for "削除不可制約" do
  it "削除できないこと" do
    klass = subject.class
    expect { subject.destroy }.not_to change(klass, :count)
  end
end

### request spec

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