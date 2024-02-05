### common example

# @see https://hkob.hatenablog.com/entry/2023/12/12/050000
shared_examples_for "単一メソッド呼び出し" do
  it "上述のメソッドの結果が正しいこと" do
    test_set.each do |method, answers|
      print "\tmst: #{method}\n"
      answers.each_slice(2) do |(v, a)|
        expect(subject.send(method, *v)).to eq a
      end
    end
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/30/050000
shared_examples_for "単一メソッド呼び出し(キーワード引数あり)" do
  it "上述のメソッドの結果が正しいこと" do
    test_set.each do |method, answers|
      print "\tmst: #{method}\n"
      answers.each_slice(3) do |(v, k, a)|
        expect(subject.send(method, *v, **k)).to eq a
      end
    end
  end
end

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

# @see https://hkob.hatenablog.com/entry/2023/12/13/050000
shared_examples_for "オブジェクト数が変化しない?" do |klass|
  it "#{klass}.count が変化しないこと" do
    expect { subject.call }.not_to change(klass, :count)
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/13/050000
shared_examples_for "オブジェクトが1増えるか?" do |klass|
  it "#{klass}.count が 1 つ増えること" do
    expect { subject.call }.to change(klass, :count).by 1
  end
end

# @see https://hkob.hatenablog.com/entry/2024/01/29/050000
shared_examples_for "オブジェクト属性が変化した?" do |klass, key, value|
  it do
    pre_value = object.send(key)
    expect { subject.call }.to change { klass.find(object.id).send(key) }.from(pre_value).to(value)
  end
end

# @see https://hkob.hatenablog.com/entry/2024/01/29/050000
shared_examples_for "オブジェクト属性が変化しない?" do |klass, key|
  it "#{klass} の #{key} が変化しないこと" do
    expect { subject.call }.not_to change(klass.find(object.id), key)
  end
end

# @see https://hkob.hatenablog.com/entry/2024/01/30/050000
shared_examples_for "オブジェクトが1減るか?" do |klass|
  it "#{klass}.count が 1 つ減ること" do
    expect { subject.call }.to change(klass, :count).by(-1)
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/06/050000
shared_examples_for "関連確認" do |model, hash|
  has_many_relations = hash[:has_many]
  has_one_relations = hash[:has_one]
  children = hash[:children] || model.to_s.pluralize
  child = hash[:child] || model
  context "#{model}を削除するとき" do
    has_many_relations&.each do |relation|
      it "#{relation}.#{children}.count が1つ減ること" do
        parent = subject.send(relation)
        expect { subject.destroy }.to change(parent.send(children), :count).by(-1)
      end
    end
    has_one_relations&.each do |relation|
      it "#{relation}.#{child} が nil になること" do
        parent = subject.send(relation)
        subject.destroy
        expect(parent.send("reload_#{child}")).to be_nil
      end
    end
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/07/050000
shared_examples_for "親削除時に自分も削除" do |model, relations|
  relations.each do |relation|
    context "#{model}.#{relation}を削除したとき" do
      it "関連により自分自身も削除されること" do
        parent = subject.send(relation)
        expect { parent.destroy }.to change(model.to_s.pluralize.classify.constantize, :count)
      end
    end
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/11/050000
shared_examples_for "降順確認" do |start, block|
  it "降順に並んでいること" do
    subject.each do |object|
      value = block.call(object)
      expect(value <=> start).to be <= 0
      start = value
    end
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

# @see https://hkob.hatenablog.com/entry/2023/12/24/050000
shared_examples_for "リダイレクト確認" do
  it do
    subject.call
    expect(response).to redirect_to(return_path)
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/25/050000
shared_examples_for "Notice メッセージ確認" do |str|
  it "notice に「#{str}」が出力されること" do
    subject.call
    expect(flash.now[:notice]).to eq str
  end
end

# @see https://hkob.hatenablog.com/entry/2023/12/26/050000
shared_examples_for "Alert メッセージ確認" do |str|
  it "alert に「#{str}」が出力されること" do
    subject.call
    expect(flash.now[:alert]).to eq str
  end
end