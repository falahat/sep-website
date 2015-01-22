class BrothersController < ApplicationController
  def index
    @brothers = Brother.all
    @rows = Array.new
    @byline = nil
    row = Hash.new
    row[:brothers] = @brothers
    row[:title] = "All"
    @rows.push(row)
  end

  def pledge_classes
    classes = PledgeClass.all
    @rows = Array.new
    classes.each do |pclass|
      row = Hash.new
      row[:title] = pclass.name
      row[:brothers] = pclass.brothers
      if !row[:brothers].empty?
        @rows.push(row)
      end
    end
    @byline = nil
    render("index")
  end

  def actives
    pictured = Brother.where.not(image_url: nil).where(active: true)
    not_pictured = Brother.where(image_url: nil).where(active: true)
    @rows = Array.new

    picrow = Hash.new
    unpicrow = Hash.new

    picrow[:brothers] = pictured
    picrow[:title] = nil
    unpicrow[:brothers] = not_pictured
    unpicrow[:title] = "Not Pictured"

    @rows.push(picrow)
    @rows.push(unpicrow)

    @byline = nil
    render("index")
  end

  def executive_board
    @brothers = Array.new

    toAdd = Brother.where(role: "President").first
    if !toAdd.nil?
      @brothers.push toAdd
    end

    toAdd = Brother.where(role: "External Vice President").first
    if !toAdd.nil?
      @brothers.push toAdd
    end

    toAdd = Brother.where(role: "Internal Vice President").first
    if !toAdd.nil?
      @brothers.push toAdd
    end

    toAdd = Brother.where(role: "Operations Vice President").first
    if !toAdd.nil?
      @brothers.push toAdd
    end

    @rows = Array.new
    @byline = nil
    row = Hash.new
    row[:brothers] = @brothers
    row[:title] = "Executive Board"
    @rows.push(row)
    render("index")
  end

  def show
    @brother = Brother.find(params[:id])
  end

  def new
    @brother = Brother.new()
  end

  def edit
    @brother = Brother.find(params[:id])
  end

  def create
    @brother = Brother.new(brother_params)
 
    # @brother.save
    # redirect_to @brother
  end

  def update
    # @brother = Brother.find(brother_params)
  end

  def destroy
  end

  def image(brother)
    if ((bro.image_url).nil?)
      return ('placeholder.png')
    else
      return (bro.image_url)
    end
  end

  private
  def brother_params
      params.require(:brother).permit(:name, :text, :grad_year, :pledge_class, :jobs, :companies)
  end
end
