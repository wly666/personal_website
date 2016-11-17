class TodosController < ApplicationController
  def list
    render :json => [
      {
        :text => '小时代',
        :done => true,
      },
      {
        :text => '小时代2',
        :done => false,
      }
    ]
  end
end
