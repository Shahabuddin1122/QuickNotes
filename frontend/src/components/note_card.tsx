import Image from "next/image";

const Note_card = () => {
  return (
      <>
          <div className={"w-1/5 border bg-amber-100 p-4 shadow-xl"}>
              <div className={"flex justify-between"}>
                  <h1 className={"font-bold text-xl"}>Property Listings</h1>
                  <Image src={"/vertical_dots.svg"} alt={"edit"} height={5} width={5}/>
              </div>
              <div className={"py-2"}>
                  <p>Property ID: 12345 <br/>
                      Address: 789 Oak Street, Springfield, IL, 62704 <br/>
                      Property Type: Single Family Home <br/>
                      Listing Date: July 29, 2024 <br/>
                      Price: $350,000 <br/>
                      Bedrooms: 4 <br/>
                      Bathrooms: 3 <br/>
                      Square Footage: 2,500 sq. ft. <br/>
                      Lot Size: 0.5 acres <br/>
                      Year Built: 2010...................</p>
              </div>
              <div className={"pt-6 flex justify-between"}>
                  <p className={"text-gray-500"}>Jun 23</p>
                  <div className={"flex justify-center items-center gap-6"}>
                      <Image src={"/users.svg"} alt={"edit"} height={20} width={20}/>
                      <Image src={"/star.svg"} alt={"edit"} height={20} width={20}/>
                  </div>
              </div>
          </div>
      </>
  )
}
export default Note_card;