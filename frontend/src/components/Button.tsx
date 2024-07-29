const Button = ({text}:{text:string}) => {
    return (
        <>
            <button className={"text-lg font-semibold py-2 px-10 bg-green-300 rounded-lg"}>{text}</button>
        </>
    )
}
export default Button;