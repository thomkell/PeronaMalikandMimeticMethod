# Perona-Malik Diffusion with Mimetic Method

This project implements the **Perona-Malik diffusion** equation using a **mimetic differences method** for image processing. The Perona-Malik equation is a non-linear anisotropic diffusion process designed to smooth or blur images while preserving edges. Unlike linear diffusion, which uniformly blurs an entire image, this method selectively smooths non-edge regions while preserving important structural details in high-gradient areas (i.e., edges).

## Key Features:
- **Non-linear anisotropic diffusion**: The Perona-Malik diffusion equation smooths images while maintaining sharp edges, which is critical in applications where edge detection and noise reduction are equally important.
- **Mimetic differences method**: This approach ensures that the numerical approximation respects the continuous properties of the Perona-Malik equation, improving edge preservation.

### Highlights:
- **Anisotropic Diffusion**: Limits diffusion near edges to preserve important features.
- **Mimetic Differences**: These differences respect the structure of the original equation, leading to improved stability and accuracy.
- **Improved Edge Preservation**: Areas with high-intensity gradients (edges) remain sharp, while non-edge regions are smoothed.

## Results:
- **Sharper edges**: The output images show minimal smoothing in edge regions, retaining important image details.
- **Blurring in non-edge regions**: The diffusion effectively smooths non-edge areas, reducing noise without compromising essential image structure.

## Files:

- `Matlab/peronaMalik.m`: The main script that applies the Perona-Malik diffusion algorithm.
- `Poster/CSRCR2023-06-3.pdf`: Poster of the CSRC2023 conference presentation
- `README.md`: Project description and details

Report: [Link](https://www.csrc.sdsu.edu/research_reports/CSRCR2023-06.pdf)

## Report:

The full report can be found here: [CSRCR2023-06.pdf](https://www.csrc.sdsu.edu/research_reports/CSRCR2023-06.pdf)
